/*
Copyright 2016 YANG Huan (sy.yanghuan@gmail.com).
Copyright 2016 Redmoon Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using Microsoft.CodeAnalysis.CSharp;
using Microsoft.CodeAnalysis.CSharp.Syntax;

namespace CSharpLua.LuaAst {
  public sealed class LuaCompilationUnitSyntax : LuaSyntaxNode {
    public sealed class UsingDeclare {
      public string Prefix;
      public string NewPrefix;
      public bool IsFromCode;
    }

    public string FilePath { get; set; }
    public readonly LuaSyntaxList<LuaStatementSyntax> Statements = new LuaSyntaxList<LuaStatementSyntax>();
    private LuaStatementListSyntax HeadAreaStatements = new LuaStatementListSyntax();
    private bool isImportLinq_;
    private int typeDeclarationCount_;
    private List<UsingDeclare> usingDeclares_ = new List<UsingDeclare>();

    public LuaCompilationUnitSyntax() {
      var info = Assembly.GetExecutingAssembly().GetName();
      LuaShortCommentStatement versonStatement = new LuaShortCommentStatement($" Generated by {info.Name} Compiler {info.Version}");
      HeadAreaStatements.Statements.Add(versonStatement);

      var system = LuaIdentifierNameSyntax.System;
      AddImport(system, system);
      Statements.Add(HeadAreaStatements);
    }

    public bool IsEmpty {
      get {
        return typeDeclarationCount_ == 0;
      }
    }

    public void AddMember(LuaStatementSyntax member) {
      var typeDeclaration = member as LuaTypeDeclarationSyntax;
      if (typeDeclaration != null) {
        LuaNamespaceDeclarationSyntax namespaceNode = new LuaNamespaceDeclarationSyntax(LuaIdentifierNameSyntax.Empty);
        namespaceNode.AddMemberDeclaration(typeDeclaration);
        Statements.Add(namespaceNode);
      }
      else {
        Statements.Add(member);
      }
    }

    public void ImportLinq() {
      if (!isImportLinq_) {
        AddImport(LuaIdentifierNameSyntax.Linq, LuaIdentifierNameSyntax.SystemLinqEnumerable);
        isImportLinq_ = true;
      }
    }

    private void AddImport(LuaIdentifierNameSyntax name, LuaExpressionSyntax value) {
      HeadAreaStatements.Statements.Add(new LuaLocalVariableDeclaratorSyntax(name, value));
    }

    internal void AddTypeDeclarationCount() {
      ++typeDeclarationCount_;
    }

    internal void AddImport(string prefix, string newPrefix, bool isFromCode) {
      if (!usingDeclares_.Exists(i => i.Prefix == prefix)) {
        usingDeclares_.Add(new UsingDeclare() {
          Prefix = prefix,
          NewPrefix = newPrefix,
          IsFromCode = isFromCode,
        });
      }
    }

    private void CheckUsingDeclares() {
      var imports = usingDeclares_.Where(i => !i.IsFromCode).ToList();
      if (imports.Count > 0) {
        imports.Sort((x, y) => x.Prefix.CompareTo(y.Prefix));
        foreach (var import in imports) {
          AddImport(new LuaIdentifierNameSyntax(import.NewPrefix), new LuaIdentifierNameSyntax(import.Prefix));
        }
      }

      var usingDeclares = usingDeclares_.Where(i => i.IsFromCode).ToList();
      if (usingDeclares.Count > 0) {
        usingDeclares.Sort((x, y) => x.Prefix.CompareTo(y.Prefix));
        foreach (var usingDeclare in usingDeclares) {
          AddImport(new LuaIdentifierNameSyntax(usingDeclare.NewPrefix), null);
        }

        var global = LuaIdentifierNameSyntax.Global;
        LuaFunctionExpressionSyntax functionExpression = new LuaFunctionExpressionSyntax();
        functionExpression.AddParameter(global);
        foreach (var usingDeclare in usingDeclares) {
          if (usingDeclare.Prefix != usingDeclare.NewPrefix) {
            LuaAssignmentExpressionSyntax assignment = new LuaAssignmentExpressionSyntax(new LuaIdentifierNameSyntax(usingDeclare.NewPrefix), new LuaIdentifierNameSyntax(usingDeclare.Prefix));
            functionExpression.Body.Statements.Add(new LuaExpressionStatementSyntax(assignment));
          }
          else {
            LuaMemberAccessExpressionSyntax right = new LuaMemberAccessExpressionSyntax(global, new LuaIdentifierNameSyntax(usingDeclare.Prefix));
            LuaAssignmentExpressionSyntax assignment = new LuaAssignmentExpressionSyntax(new LuaIdentifierNameSyntax(usingDeclare.NewPrefix), right);
            functionExpression.Body.Statements.Add(new LuaExpressionStatementSyntax(assignment));
          }
        }

        LuaInvocationExpressionSyntax invocationExpression = new LuaInvocationExpressionSyntax(LuaIdentifierNameSyntax.UsingDeclare, functionExpression);
        HeadAreaStatements.Statements.Add(new LuaExpressionStatementSyntax(invocationExpression));
      }
    }

    internal override void Render(LuaRenderer renderer) {
      CheckUsingDeclares();
      renderer.Render(this);
    }
  }
}
-- Generated by CSharp.lua Compiler 1.0.0.0
local System = System
return function (dir) 
  dir = (dir and #dir > 0) and (dir .. '.') or ""
  local require = require
  local load = function(module) return require(dir .. module) end

  load("LuaAst.LuaArgumentSyntax")
  load("LuaAst.LuaBlockSyntax")
  load("LuaAst.LuaCompilationUnitSyntax")
  load("LuaAst.LuaExpressionSyntax")
  load("LuaAst.LuaFunctionExpressSyntax")
  load("LuaAst.LuaIdentifierNameSyntax")
  load("LuaAst.LuaIfStatementSyntax")
  load("LuaAst.LuaInvocationExpressionSyntax")
  load("LuaAst.LuaLiteralExpressionSyntax")
  load("LuaAst.LuaLocalDeclarationStatementSyntax")
  load("LuaAst.LuaLoopStatement")
  load("LuaAst.LuaMemberAccessExpressionSyntax")
  load("LuaAst.LuaParameterSyntax")
  load("LuaAst.LuaStatementSyntax")
  load("LuaAst.LuaSyntaxNode")
  load("LuaAst.LuaTableInitializerExpression")
  load("LuaAst.LuaTypeDeclarationSyntax")
  load("LuaAst.LuaWrapFunctionStatementSynatx")
  load("LuaRenderer")
  load("LuaSyntaxGenerator")
  load("LuaSyntaxNodeTransfor")
  load("Program")
  load("Utils")
  load("Worker")
  load("XmlMetaProvider")

  System.init({
    "CSharpLua.LuaAst.LuaSyntaxNode", 
    "CSharpLua.LuaAst.LuaExpressionSyntax", 
    "CSharpLua.LuaAst.LuaStatementSyntax", 
    "CSharpLua.LuaAst.LuaLiteralExpressionSyntax", 
    "CSharpLua.LuaAst.LuaWrapFunctionStatementSynatx", 
    "CSharpLua.LuaAst.LuaFunctionExpressionSyntax", 
    "CSharpLua.LuaAst.LuaBlockSyntax", 
    "CSharpLua.LuaAst.LuaConstLiteralExpression", 
    "CSharpLua.LuaAst.LuaTypeDeclarationSyntax", 
    "CSharpLua.LuaAst.LuaTableItemSyntax", 
    "CSharpLua.LuaAst.LuaVariableDeclarationSyntax", 
    "CSharpLua.LuaAst.LuaIdentifierNameSyntax", 
    "CSharpLua.LuaAst.LuaSyntaxNode.Keyword", 
    "CSharpLua.LuaAst.LuaTableKeySyntax", 
    "CSharpLua.LuaAst.LuaCheckReturnFunctionExpressionSyntax", 
    "CSharpLua.LuaSyntaxNodeTransfor.LuaSyntaxSearcher", 
    "CSharpLua.CmdArgumentException", 
    "CSharpLua.CompilationErrorException", 
    "CSharpLua.LuaAst.LuaArgumentListSyntax", 
    "CSharpLua.LuaAst.LuaArgumentSyntax", 
    "CSharpLua.LuaAst.LuaArrayRankSpecifierSyntax", 
    "CSharpLua.LuaAst.LuaArrayTypeAdapterExpressionSyntax", 
    "CSharpLua.LuaAst.LuaAssignmentExpressionSyntax", 
    "CSharpLua.LuaAst.LuaBinaryExpressionSyntax", 
    "CSharpLua.LuaAst.LuaBlankLinesStatement", 
    "CSharpLua.LuaAst.LuaBlockStatementSyntax", 
    "CSharpLua.LuaAst.LuaBreakStatementSyntax", 
    "CSharpLua.LuaAst.LuaCharacterLiteralExpression", 
    "CSharpLua.LuaAst.LuaClassDeclarationSyntax", 
    "CSharpLua.LuaAst.LuaCodeTemplateExpressionSyntax", 
    "CSharpLua.LuaAst.LuaCompilationUnitSyntax", 
    "CSharpLua.LuaAst.LuaCompilationUnitSyntax.UsingDeclare", 
    "CSharpLua.LuaAst.LuaConstructorAdapterExpressionSyntax", 
    "CSharpLua.LuaAst.LuaContinueAdapterStatementSyntax", 
    "CSharpLua.LuaAst.LuaElseClauseSyntax", 
    "CSharpLua.LuaAst.LuaElseIfStatementSyntax", 
    "CSharpLua.LuaAst.LuaEnumDeclarationSyntax", 
    "CSharpLua.LuaAst.LuaEqualsValueClauseListSyntax", 
    "CSharpLua.LuaAst.LuaEqualsValueClauseSyntax", 
    "CSharpLua.LuaAst.LuaExpressionStatementSyntax", 
    "CSharpLua.LuaAst.LuaExpressionSyntax.EmptyLuaExpressionSyntax", 
    "CSharpLua.LuaAst.LuaForInStatementSyntax", 
    "CSharpLua.LuaAst.LuaGotoCaseAdapterStatement", 
    "CSharpLua.LuaAst.LuaGotoStatement", 
    "CSharpLua.LuaAst.LuaIdentifierLiteralExpressionSyntax", 
    "CSharpLua.LuaAst.LuaIfStatementSyntax", 
    "CSharpLua.LuaAst.LuaInterfaceDeclarationSyntax", 
    "CSharpLua.LuaAst.LuaInternalMethodExpressionSyntax", 
    "CSharpLua.LuaAst.LuaInvocationExpressionSyntax", 
    "CSharpLua.LuaAst.LuaKeyValueTableItemSyntax", 
    "CSharpLua.LuaAst.LuaLabeledStatement", 
    "CSharpLua.LuaAst.LuaLineMultipleExpressionSyntax", 
    "CSharpLua.LuaAst.LuaLocalDeclarationStatementSyntax", 
    "CSharpLua.LuaAst.LuaLocalVariableDeclaratorSyntax", 
    "CSharpLua.LuaAst.LuaLocalVariablesStatementSyntax", 
    "CSharpLua.LuaAst.LuaLongCommentStatement", 
    "CSharpLua.LuaAst.LuaMemberAccessExpressionSyntax", 
    "CSharpLua.LuaAst.LuaMultipleAssignmentExpressionSyntax", 
    "CSharpLua.LuaAst.LuaMultipleReturnStatementSyntax", 
    "CSharpLua.LuaAst.LuaNamespaceDeclarationSyntax", 
    "CSharpLua.LuaAst.LuaParameterListSyntax", 
    "CSharpLua.LuaAst.LuaParameterSyntax", 
    "CSharpLua.LuaAst.LuaParenthesizedExpressionSyntax", 
    "CSharpLua.LuaAst.LuaPrefixUnaryExpressionSyntax", 
    "CSharpLua.LuaAst.LuaPropertyAdapterExpressionSyntax", 
    "CSharpLua.LuaAst.LuaPropertyOrEventIdentifierNameSyntax", 
    "CSharpLua.LuaAst.LuaRepeatStatementSyntax", 
    "CSharpLua.LuaAst.LuaReturnStatementSyntax", 
    "CSharpLua.LuaAst.LuaShortCommentStatement", 
    "CSharpLua.LuaAst.LuaSingleTableItemSyntax", 
    "CSharpLua.LuaAst.LuaStatementListSyntax", 
    "CSharpLua.LuaAst.LuaStatementSyntax.EmptyLuaStatementSyntax", 
    "CSharpLua.LuaAst.LuaStringLiteralExpressionSyntax", 
    "CSharpLua.LuaAst.LuaStructDeclarationSyntax", 
    "CSharpLua.LuaAst.LuaSwitchAdapterStatementSyntax", 
    "CSharpLua.LuaAst.LuaSymbolNameSyntax", 
    "CSharpLua.LuaAst.LuaSyntaxList_1", 
    "CSharpLua.LuaAst.LuaSyntaxNode.Semicolon", 
    "CSharpLua.LuaAst.LuaSyntaxNode.Tokens", 
    "CSharpLua.LuaAst.LuaTableExpressionKeySyntax", 
    "CSharpLua.LuaAst.LuaTableIndexAccessExpressionSyntax", 
    "CSharpLua.LuaAst.LuaTableInitializerExpression", 
    "CSharpLua.LuaAst.LuaTableLiteralKeySyntax", 
    "CSharpLua.LuaAst.LuaTryAdapterExpressionSyntax", 
    "CSharpLua.LuaAst.LuaTypeLocalAreaSyntax", 
    "CSharpLua.LuaAst.LuaUsingAdapterExpressionSyntax", 
    "CSharpLua.LuaAst.LuaVariableDeclaratorSyntax", 
    "CSharpLua.LuaAst.LuaVariableListDeclarationSyntax", 
    "CSharpLua.LuaAst.LuaVerbatimStringLiteralExpressionSyntax", 
    "CSharpLua.LuaAst.LuaWhileStatementSyntax", 
    "CSharpLua.LuaRenderer", 
    "CSharpLua.LuaSyntaxGenerator", 
    "CSharpLua.LuaSyntaxGenerator.PretreatmentChecker", 
    "CSharpLua.LuaSyntaxGenerator.SettingInfo", 
    "CSharpLua.LuaSyntaxNodeTransfor", 
    "CSharpLua.LuaSyntaxNodeTransfor.BlockCommonNode", 
    "CSharpLua.LuaSyntaxNodeTransfor.ContinueSearcher", 
    "CSharpLua.LuaSyntaxNodeTransfor.LocalVarSearcher", 
    "CSharpLua.LuaSyntaxNodeTransfor.LuaSyntaxSearcher.FoundException", 
    "CSharpLua.LuaSyntaxNodeTransfor.MethodInfo", 
    "CSharpLua.LuaSyntaxNodeTransfor.ReturnStatementSearcher", 
    "CSharpLua.PartialTypeDeclaration", 
    "CSharpLua.Program", 
    "CSharpLua.Utility", 
    "CSharpLua.Worker", 
    "CSharpLua.XmlMetaProvider", 
    "CSharpLua.XmlMetaProvider.MethodMetaInfo", 
    "CSharpLua.XmlMetaProvider.TypeMetaInfo", 
    "CSharpLua.XmlMetaProvider.XmlMetaModel", 
    "CSharpLua.XmlMetaProvider.XmlMetaModel.ArgumentModel", 
    "CSharpLua.XmlMetaProvider.XmlMetaModel.AssemblyModel", 
    "CSharpLua.XmlMetaProvider.XmlMetaModel.ClassModel", 
    "CSharpLua.XmlMetaProvider.XmlMetaModel.ExportModel", 
    "CSharpLua.XmlMetaProvider.XmlMetaModel.ExportModel.AttributeModel", 
    "CSharpLua.XmlMetaProvider.XmlMetaModel.FieldModel", 
    "CSharpLua.XmlMetaProvider.XmlMetaModel.MethodModel", 
    "CSharpLua.XmlMetaProvider.XmlMetaModel.NamespaceModel", 
    "CSharpLua.XmlMetaProvider.XmlMetaModel.PropertyModel", 
    "CSharpLua.XmlMetaProvider.XmlMetaModel.PropertyModel.FieldPropery", 
    "CSharpLua.XmlMetaProvider.XmlMetaModel.TemplateModel"
  }, {
    Main = "CSharpLua.Program.Main"
  })
end

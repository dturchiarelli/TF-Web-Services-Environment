# main.tf

resource "azurerm_app_service_plan" "default" {
  name                = "${var.environment_prefix}-ws-plan"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  tags                = "${var.tags}"

  sku {
    tier = "${var.app_service_plan_sku_tier}"
    size = "${var.app_service_plan_sku_size}"
  }
}

resource "azurerm_application_insights" "default" {
  name                = "${var.environment_prefix}-ws-ai"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  application_type    = "Web"
  tags                = "${var.tags}"
}

resource "azurerm_app_service" "api" {
  name                = "${var.environment_prefix}-ws"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  app_service_plan_id = "${azurerm_app_service_plan.default.id}"
  tags                = "${var.tags}"

  app_settings {
    "APPINSIGHTS_INSTRUMENTATIONKEY"                  = "${azurerm_application_insights.default.instrumentation_key}"
    "APPINSIGHTS_PROFILERFEATURE_VERSION"             = "1.0.0"
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"             = "1.0.0"
    "ApplicationInsightsAgent_EXTENSION_VERSION"      = "~2"
    "DiagnosticServices_EXTENSION_VERSION"            = "~3"
    "InstrumentationEngine_EXTENSION_VERSION"         = "~1"
    "SnapshotDebugger_EXTENSION_VERSION"              = "~1"
    "XDT_MicrosoftApplicationInsights_BaseExtensions" = "~1"
    "XDT_MicrosoftApplicationInsights_Mode"           = "recommended"
  }
}
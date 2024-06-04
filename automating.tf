resource "thousandeyes_agent_to_agent" "agent_to_agent_internet_azureTE" {
  test_name      = "POD99 - CL24 - internet > azureTE"
  description    = "by terraform Cloud at ${local.now}"
  interval       = var.test_interval
  direction = "BIDIRECTIONAL"
  protocol = "TCP"
  target_agent_id = "1317050"
  bgp_measurements = false
  alerts_enabled = true
  dynamic "agents" {
    for_each = local.agentAddId
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_dns_server" "dns_server_internet_nopcommerceDNS" {
  test_name      = "POD99 - CL24 - internet > nopcommerceDNS"
  description    = "by terraform Cloud at ${local.now}"
  interval       = var.test_interval
  alerts_enabled = true
  domain = "nopcommerce-demo.eastus.cloudapp.azure.com A"
  bgp_measurements = false
  dynamic "dns_servers" {
    for_each = local.server_dns_name
    content {
      server_name = dns_servers.value
    }
  }
  dynamic "agents" {
    for_each = local.agentAddId
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_dns_trace" "dns_trace_internet_nopcommerceDNStrace" {
  test_name      = "POD99 - CL24 - internet > nopcommerceDNStrace"
  description    = "by terraform Cloud at ${local.now}"
  interval       = var.test_interval
  alerts_enabled = true
  domain = "nopcommerce-demo.eastus.cloudapp.azure.com A"
  dynamic "agents" {
    for_each = local.agentAddId
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_page_load" "page_load_internet_nopcommerceWeb" {
  test_name      = "POD99 - CL24 - internet > nopcommerceWeb"
  description    = "by terraform Cloud at ${local.now}"
  alerts_enabled = true
  url            = "https://nopcommerce-demo.eastus.cloudapp.azure.com/"
  interval      = var.test_interval
  http_interval = var.test_interval
  bgp_measurements = false
  dynamic "agents" {
    for_each = local.agentAddId
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_http_server" "http_server_internet_thousandeyes" {
  test_name =  "POD99 - CL24 - internet > thousandeyes"
  description    = "by terraform Cloud at ${local.now}"
  interval       = var.test_interval
  alerts_enabled = true
  url = "https://www.thousandeyes.com"
  bgp_measurements = false
 dynamic "agents" {
    for_each = local.agentAddId
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_agent_to_agent" "agent_to_agent_azureTE_OnPremTE" {
  test_name      = "POD99 - CL24 - azureTE <> OnPremTE"
  description    = "by terraform Cloud at ${local.now}"
  interval       = var.test_interval
  alerts_enabled = true
  direction = "BIDIRECTIONAL"
  protocol = "TCP"
  target_agent_id = "1317054"
  bgp_measurements = false
  agents {
    agent_id   = 1317050
  }
}

resource "thousandeyes_agent_to_server" "agent_to_server_azureTE_OnPremDB" {
  test_name      = "POD99 - CL24 - azureTE > OnPremDB"
  description    = "by terraform Cloud at ${local.now}"
  interval       = var.test_interval
  alerts_enabled = true
  server = "172.40.142.21"
  port   = 3306
  bgp_measurements = false

  agents {
    agent_id   = 1317050
  }
}
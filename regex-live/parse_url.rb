def parse_url(url)
  # write regex to capture some part of the URL
  match_data = url.match(/(?<scheme>^https?):\/\/(?<subdomain>\w+)\.(?<domain>[\w-]+)(?<top_level_domain>\.\w{2,10})/)

  {
    scheme: match_data[:scheme],
    subdomain: match_data[:subdomain],
    domain: match_data[:domain],
    top_level_domain: match_data[:top_level_domain],
    params: {},
    path: []
  }
end

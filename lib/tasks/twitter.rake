task(:scrape) do
  p "Let's scrape Senate Twitters!"
  p "Ready... set... go!"

  browser = Ferrum::Browser.new(browser_options: { 'no-sandbox': nil })
  browser.goto("https://www.senate.gov/senators/contact")
  links = browser.css("div.contenttext a")

  link = links.at(1)

  contact_url = link.attribute(:href)

  p "Visiting #{contact_url}..."

  browser.goto(contact_url)

  senator_page_links = browser.css("a")

  senator_page_links.each do |sp_link|
    if sp_link.text.strip == "Twitter"
      p sp_link.attribute(:href)
    end
  end


  # links.each_with_index do |link, index|
  #   if index.odd?
  #     contact_url = link.attribute(:href)

  #     p "Visiting #{contact_url}..."

  #     browser.goto(contact_url)

  #     p browser.css("a").count
  #   end

  #   browser.back
  # end
end
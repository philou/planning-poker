def have_histogram(points, progress_attributes = {})
  progress_xpath = progress_attributes.map do |attribute, expected|
    "[td/progress/@#{attribute}=#{expected}]"
  end.join
  have_xpath("//tr[td/span/text()=#{points}]" + progress_xpath)
end


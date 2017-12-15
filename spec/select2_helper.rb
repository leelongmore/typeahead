module Select2Helper
  def select2(term, value)
    find(".select2-container").click
    find(".select2-search__field").set(term)
    within ".select2-results" do
      find("li", text: value).click
    end
  end
end

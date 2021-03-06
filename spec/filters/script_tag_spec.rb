describe DespamilatorFilter::ScriptTag do

  the_name_should_be 'Script tag'
  the_description_should_be 'Searches for variations for the HTML script tag'

  despamilator_should_apply_the_filter_for('<script>')

  a_single_match_of('<script>', should_score: 1)
  a_multiple_match_of('<script></script> <script></script>', should_score: [1, 1.times])

  describe "detecting various script tags" do
    ['<script type="whatever">', '<script></script>', '</script>', '<script>', "<script\n>"].each do |script_tag|
      [script_tag.upcase, script_tag.downcase].each do |script_tag|
        it "should detect '#{script_tag}' of a script tag" do
          dspam = Despamilator.new(script_tag)
          dspam.score.should == 1
        end
      end
    end
  end

end

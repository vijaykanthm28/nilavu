##
## Copyright [2013-2015] [Megam Systems]
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
## http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##
module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Megam"
    if page_title.empty?
    base_title
    else
      "#{base_title} | #{page_title}"
    end
  end


  def normalized_filename(file)
    # file.to_s.gsub(".html", "").gsub(".erb", "")
    # file.to_s.gsub(".html", "").gsub(".erb", "")
    file.to_s
  end

  def normalize_template_name(name)
    # normalized_filename(name.to_s).gsub("/", "-")
    normalized_filename(name.to_s)#.gsub("/", "-")
  end

end

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
module Backup
class Buckets < BackupService
  def initialize(params)
    super(params)
  end

  def list
    bkts = cephs3.buckets
    buckets = []
    tsize =0
    size =0
    bkts.each do |bkt|
      bkt.objects.each do |obj|
        size += obj.size.to_i
      end
      buckets.push(bucket_name: "#{bkt.name}", size: size.to_s(:human_size), noofobjects: bkt.objects.count)
      tsize += size
    end
    { total_buckets: bkts.count, bucket_array: buckets, total_size: size }
  end

  def create(name)
    bucket = cephs3.buckets.build(name)
    bucket.save
  end

  def delete(name)
    bucket = cephs3.buckets.find("#{name}")
    bucket.destroy
  end
end
end
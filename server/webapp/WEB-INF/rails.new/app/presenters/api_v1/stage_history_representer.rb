##########################################################################
# Copyright 2015 ThoughtWorks, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##########################################################################

module ApiV1
  class StageHistoryRepresenter < BaseRepresenter
    attr_accessor :stages, :pipeline_name, :stage_name

    def initialize(stages, params)
      @stages        = stages
      @pipeline_name = params[:pipeline_name]
      @stage_name    = params[:stage_name]
    end

    link :self do |opts|
      puts stage_name
      opts[:url_builder].apiv1_stage_history_api_url(pipeline_name: pipeline_name, stage_name: stage_name)
    end

    link :doc do
      'http://api.go.cd/#get-stage-history'
    end

    collection :stages, embedded: true, exec_context: :decorator, decorator: StageRepresenter

  end
end

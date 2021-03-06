class LaunchablesController < ApplicationController
  include LaunchableAssembler
  include LaunchablePreparer
  include LaunchableIdentifier

    respond_to :html, :js

    skip_before_filter :check_xhr

    before_action :add_authkeys_for_api, only: [:index]

    # STEP1: assemble the launchable.
    # - prepare billing, region and compute size to launch
    def assemble
        render json: assembled
    end

    # STEP2: prepare  the launchable
    # - Get the list from the marketplace_pools_grooups
    #   The groups are
    #       virtualmachines, applications, containers, customapps, prepackaged
    def prepare
       render json: prepare(params)
    end

    # STEP3: identity  the launchable.
    # - include sshkey
    def identify
      #  render json: identify(params)
    end
end

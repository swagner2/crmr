module Jumpstart
  class DocsController < ::ApplicationController
    def icons
      @icons = Dir.chdir(Rails.root.join('app/assets/images')) do
        Dir.glob("icons/*.svg").sort
      end
    end
  end
end

require 'json'
require 'virtualbox'
require "vagrant/util/glob_loader"

module Vagrant
  class << self
    # The source root is the path to the root directory of
    # the Vagrant gem.
    def source_root
      @source_root ||= File.expand_path('../../', __FILE__)
    end
  end
end

# Load them up. One day we'll convert this to autoloads. Today
# is not that day. Low hanging fruit for anyone wishing to do it.
libdir = File.expand_path("lib/vagrant", Vagrant.source_root)
Vagrant::GlobLoader.glob_require(libdir, %w{util util/stacked_proc_runner
  downloaders/base config provisioners/base provisioners/chef systems/base
  commands/base commands/box action/exception_catcher hosts/base})

# Initialize the built-in actions
Vagrant::Action.builtin!

# encoding: utf-8
require 'singleton'
module FastExt
  class View
    include Singleton
    attr_accessor :version, :project, :copyright

    def initialize
      @project = 'FastExt Rapid Development Framework'
      @version = "version #{FastExt::VERSION} built on ExtJS 4.2.1"
      @copyright = 'Copyright 2013-2014 sgzhe@163.com.'
    end


    def win(name, opts = {}, &block)
      FastExt::Window.new(name, opts, &block)
    end

    def tab(name, tab)
      FastExt::Tab.new(name, tab)
    end

    def config(&block)
      block.call(self) if block_given?
    end

    def find_window(name)
      FastExt::Window.find(name) || {}
    end
  end
end


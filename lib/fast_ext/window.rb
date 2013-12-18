# encoding: utf-8

module FastExt
  class Window

    @windows ||= {}
    class << self
      attr_accessor :windows
      def find(name)
        @windows[name.to_s]
      end
    end

    attr_accessor :name, :title, :window_kind, :tabs

    #:opts => {:name => 'm_window', tabs:[:m_window,:m_tab,:m_field]}
    def initialize(name, opts = {}, &block)
      self.name = name
      opts.each_pair do |k,v|
        self.send "#{k}=",  v
      end
      self.tabs = self.tabs || []
      block.call(self) if block_given?
      self.wrap_tab
      self.class.windows[name.to_s] = self
    end

    def wrap_tab
      self.tabs.each_index do |i|
        tab = self.tabs[i]
        unless tab.kind_of?(FastExt::Tab)
          raise "not fond #{tab} ui." unless FastExt::Tab.find(tab)
          self.tabs[i] =  FastExt::Tab.find(tab)
        end
      end
    end

    def tab(name, opts = {})
      self.tabs << (opts.blank? ? name : FastExt::Tab.new(name,opts))
    end

  end
end

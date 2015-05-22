require "xproc/version"

module XProc
  class Proc < BasicObject
    attr_reader :index

    def initialize(index, invocations = [])
      @index = index
      @invocations = invocations
    end

    def to_proc
      invocations = @invocations
      index = @index
      ::Kernel.lambda do |*proc_args|
        invocations.reduce(proc_args[index]) do |val, (name, args, block)|
          args = args.map do |arg|
            if arg.is_a?(::XProc::Proc)
              proc_args[arg.index]
            else
              arg
            end
          end
          val.send(name, *args, &block)
        end
      end
    end

    def respond_to_missing?(*)
      true
    end

    def method_missing(name, *args, &block)
      ::XProc::Proc.new(@index, @invocations + [[name, args, block]])
    end

    undef :==
    undef :!=
    undef :!
  end

  module CoreExt
    def x
      ::XProc::Proc.new(0)
    end

    def x1
      ::XProc::Proc.new(0)
    end

    def x2
      ::XProc::Proc.new(1)
    end

    def x3
      ::XProc::Proc.new(2)
    end

    def x4
      ::XProc::Proc.new(3)
    end
  end

  begin
    refine Object do
      include ::XProc::CoreExt
    end
  rescue NoMethodError => e
  end
end

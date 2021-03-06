module Taskiq
  class << self
    include Rake::DSL if defined?(Rake::DSL)
    def add_delayed_tasks
      Rake::Task.tasks.each do |task|
        task "delay:#{task.name}", *task.arg_names do |t, args|
          Rake::Task["environment"].invoke
          values = args.to_hash.values.empty? ? "" : "[" + args.to_hash.values.join(",") + "]"
          invocation = task.name + values
          Taskiq::PerformableTask.perform_async(invocation)
          puts "Enqueued job: rake #{invocation}"
        end
      end
    end
  end
end

Taskiq.add_delayed_tasks

require "rspec"
require_relative "list"

describe List do
  let(:title) { "Grocery List" }

  let(:tasks) do
    tasks = []
    tasks << mock(:task, :description => "Bananas", :complete? => false, :complete! => true)
    tasks << mock(:task, :description => "Apples", :complete? => true, :complete! => true)
    tasks << mock(:task, :description => "Peaches", :complete? => true, :complete! => true)
    tasks 
  end

  let(:task) do
    mock(:task, :description => "Sugar", :complete? => false, :complete! => true)
  end

  let(:list) { List.new(title, tasks) }


  describe "#initialize" do
    context 'with valid input' do
      it 'makes list an instance of List' do
        list.should be_an_instance_of List
      end
    end

    context 'with invalid input' do
      it 'requires an argument' do
        expect { List.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#add_task' do
    context 'with valid input' do
      it 'adds a task to the list' do
        list.add_task(task)
        list.tasks.last.should eq(task)
      end
    end
  end

  describe "#complete_task" do
    context 'with valid input' do

      it 'expects task to receive complete message' do
        list.tasks[0].should_receive(:complete!)
        list.complete_task(0)
      end

    end

    context 'with invalid input' do
      it 'returns error if index is greater than length of array' do
        expect { list.complete_task(4)}.to raise_error(InvalidTaskError)
      end
    end
  end

  describe "#delete_task" do
    context 'with valid input' do
      it 'expects task to receive delete_at message' do
      a = list.tasks[0]
      list.delete_task(0)
      list.tasks.include?(a).should eq(false)
      end
    end

    context 'with invalid input' do
      it 'raises error if index is greater than length of list' do
        expect { list.delete_task(5) }.to raise_error(InvalidTaskError)
      end
    end
  end

  describe "#completed_tasks" do
    context 'returns completed tasks' do
      it 'lists the tasks that are completed' do
        list.completed_tasks.length.should eq(2)
      end
    end
  end

  describe "#incomplete_tasks" do
    context 'returns incomplete tasks' do
      it 'lists the tasks that are incomplete' do
        list.incomplete_tasks.length.should eq(1)
      end
    end
  end

end






describe "Rspec Greeter" do
  it "should say 'Hello Rspec!' when it recives greet() message" do
      greeter = RSpecGreeter.new
      greeting = greeter.greet
      greeting.should == "Hello Rspec!"
   end
end

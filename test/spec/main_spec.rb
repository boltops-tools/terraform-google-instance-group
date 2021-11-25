describe "main" do
  before(:all) do
    mod_path = File.expand_path("../..", __dir__) # the source of the module to test is 2 levels up
    # Build terraspace project to use as a test harness
    # Will be located at: /tmp/terraspace/test-harnesses/instance_group-harness
    terraspace.build_test_harness(
      name: "instance_group-harness",
      modules: {instance_group: mod_path},
      stacks:  {instance_group: "#{mod_path}/test/spec/fixtures/stack"}, # folder with the stack module files
    )
    terraspace.up("instance_group")
  end
  after(:all) do
    terraspace.down("instance_group")
  end

  it "successful deploy" do
    instance_template_id = terraspace.output("instance_group", "instance_template_id")
    expect(instance_template_id).to include("ig-test-")
  end
end

guard :rspec, cmd: 'bundle exec rspec' do
  watch(%r{^spec/(.+)_spec\.rb$})
  watch(%r{^(recipes)/(.+)\.rb$})   { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')      { 'spec' }
end

guard :rubocop, cli: %w(--config .rubocop.yml) do
  watch(%r{.+\.rb$}) # rubocop:disable all
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end

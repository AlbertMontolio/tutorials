def block_scope_demo
  x = 100
  1.times do
    puts x
    x = "albert"
  end
  puts x
end

block_scope_demo


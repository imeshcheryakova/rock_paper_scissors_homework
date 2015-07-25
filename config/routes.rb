Rails.application.routes.draw do
  # This route is for the bare domain. You can ignore it.
  get("/play/:the_move", { :controller => "game", :action => "rps" })

  # Your code goes below.

end

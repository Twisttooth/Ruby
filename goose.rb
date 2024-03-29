
# Generates a random ASCII art of a goose.

  # Returns:
  # - A string containing the ASCII art of a goose.
class GooseGenerator
  def draw
    if rand(2) == 0
      goose = <<-ART
                                                        _...--.
                                        _____......----'     .'
                                  _..-''                   .'
                                .'                       ./
                        _.--._.'                       .' |
                     .-'                           .-.'  /
                   .'   _.-.                     .  \\   '
                 .'  .'   .'    _    .-.        / `./  :
               .'  .'   .'  .--' `.  |  \\  |`. |     .'
            _.'  .'   .' `.'       `-'   \\ / |.'   .'
         _.'  .-'   .'     `-.            `      .'
       .'   .'    .'          `-.._ _ _ _ .-.    :
      /    /o _.-'               .--'   .'   \\   |
    .'-.__..-'                  /..    .`    / .'
  .'   . '                       /.'/.'     /  |
 `---'                                   _.'   '
                                       /.'    .'
                                        /.'/.'

              ART
            else
              goose = <<-ART
                                   ___
                               ,-""   `.
                             ,'  _   e )`-._
                            /  ,' `-._<.===-'
                           /  /
                          /  ;
              _          /   ;
 (`._    _.-"" ""--..__,'    |
 <_  `-""                     \\
  <`-                          :
   (__   <__.                  ;
     `-.   '-.__.      _.'    /
        \\      `-.__,-'    _,'
         `._    ,    /__,-'
            ""._\\__,'< <____
                 | |  `----.`.
                 | |        \\ `.
                 ; |___      \\-``
                 \\   --<
                  `.`.<
                    `-'
        ART
            end
  end
end

generator = GooseGenerator.new
puts generator.draw

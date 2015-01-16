require_relative 'db'

Recipe.create({ :title => "Steaks",
                :created_by => "Zee",
                :description => "nom. Nom. NOM",
                :instructions => "Get a steak. Put it on a grill. Wait a few
                seconds. Take it off the grill. EAT THAT STEAK!" })

Recipe.create({ :title => "Not-Steaks",
                :created_by => "No one I know",
                :description => "WTF? I don't even!",
                :instructions => "Get some not steaks. Throw them away. Go make
                Steaks." })


class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        # binding.pry
        user = User.find(user_id)
        attraction = Attraction.find(attraction_id)

        if user.tickets < attraction.tickets && user.height < attraction.min_height
            "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
        elsif user.tickets < attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif user.height < attraction.min_height
            "Sorry. You are not tall enough to ride the Roller Coaster."
        else
            user_tickets = user.tickets - attraction.tickets
            user_nausea = user.nausea + attraction.nausea_rating
            user_happiness = user.happiness + attraction.happiness_rating
            self.user.update(tickets: user_tickets, nausea: user_nausea, happiness: user_happiness)
        end
    end
end

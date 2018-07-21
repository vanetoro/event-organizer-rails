Host.destroy_all
Event.destroy_all


@vane = Host.create(name: 'Vane', email: 'vane@me.com', password: '1234')
@rachel = Host.create(name: 'rachel', email: 'rachel@me.com', password: '1234')

@christian = Event.create(name: 'Christian Loefler' ,description: 'CL @ elsewhere', date: '08/03/18')
@vane.events << @christian


@cider_house = Venue.create(:name 'Bushwick Cider House', :location: 'Bushwick')

require_relative "../../lib/airplane"



describe Airplane do

  let (:my_plane) { Airplane.new("cesna", 10, 150, 100) }

  describe "#initialize" do
    it "specifies type of airplane" do
      expect(my_plane.type).to eq("cesna")
    end

    it "specifies airplane's wing loading" do
      expect(my_plane.wing_loading).to eq(10)
    end

    it "specifies airplane's horsepower" do
      expect(my_plane.horsepower).to eq(150)
    end

    it "specifies airplane's fuel" do
      expect(my_plane.fuel).to eq(100)
    end

  end

  describe "#start" do

    it "turns on the plane if it was off" do
      expect(my_plane.start).to eq(true)
    end

    it "Throws error: 'The plane is already on'" do
      my_plane.start
      expect {my_plane.start}.to raise_error(RuntimeError, 'The plane is already on')
    end

    it "throws error if there is no fuel" do
      my_plane.fuel = 0
      expect {my_plane.start}.to raise_error(RuntimeError, 'Cannot start plane, no fuel')
    end
  end

  describe "#takeoff" do
    context "the engine is off" do
      it "tells user to start the engine" do
        expect(my_plane.takeoff).to eq("Start the engine first")
      end
    end
    context "the engine is on" do
      it "announces liftoff" do
        my_plane.start
        expect(my_plane.takeoff).to eq("We have liftoff!")
      end
      it "warns fuel is too low when fuel is below 40" do
        my_plane.fuel = 39
        expect{my_plane.takeoff}.to raise_error(RuntimeError, 'Cannot take off, fuel is too low')
      end
    end
  end

  describe "#land" do
    context "the airplane isn't started" do
      it "tells user to start the airplane" do
        expect(my_plane.land).to eq("Airplane has not started, please start")
      end
    end
    context "the user has started the engine, not taken off, but tells plane to land" do
      it "tells user that the plane is already on the ground" do
        my_plane.start
        expect(my_plane.land).to eq("Airplane is already on the ground")
      end
    end
    context "the plane is already in the air and the user decides to land" do
      it "tells the user the plane has landed" do
        my_plane.start
        my_plane.takeoff
        expect(my_plane.land).to eq("Houston, the Eagle has landed")
      end
      it "tells the user that it was a good thing they landed - fuel was running out!" do
        my_plane.start
        my_plane.takeoff
        my_plane.fuel = 5
        expect{my_plane.land}.to raise_error(RuntimeError, "Good thing you landed when you did - fuel was running out!")
      end
    end
  end
end

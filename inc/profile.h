// This program is used for generating reflow temperature profiles

struct profile {
    volatile unsigned int temp_targets[180];
};

struct profile generate_RSS_profile(struct profile temp_profile, unsigned int soak_time, unsigned int spike_time, unsigned int cooling_time){
   // RSS is a Ramp, Soak, Spike profile that has 4 regions
   // 1: Preheating zone, 2: Soak zone, 3: Reflow zone (spike), 4: Cooling Zone
   // each array element holds the target temperature every 2 seconds
   // need to be able to handle the case where the boundary times are odd numbers
   unsigned int target_temp = 25; // assume that the starting temperature is 22 degrees
   unsigned int cur_time_index = 1;
   temp_profile.temp_targets[0] = target_temp;
   // fill the elements for the ramp period
   if (soak_time % 2 != 0)
   {
      // the soak time boundary is an odd number
      soak_time = soak_time + 1; // stop one element after the boundary
      for (int time_index = 1; time_index < (soak_time / 2) + 1; time_index++)
      {
         // the temperature increases by 2 degrees per second in this zone
         target_temp = target_temp + 4;
         temp_profile.temp_targets[time_index] = target_temp;
      }
      // since the boundary is an odd number, have overshot by 2 degrees
      cur_time_index = (soak_time / 2);
      target_temp = target_temp - 2;
      temp_profile.temp_targets[cur_time_index] = target_temp;
   }
   else
   {
      for (int time_index = cur_time_index; time_index < (soak_time / 2) + 1; time_index++)
      {
         target_temp = target_temp + 4;
         temp_profile.temp_targets[time_index] = target_temp;
      }
      // undo extra increment of for loop
      cur_time_index = (soak_time / 2);
   }
   // fill the elements for the soak period
   //  this region remains a constant target temperature
   if (spike_time % 2 != 0)
   {
      // the spike time boundary is an odd number
      spike_time = spike_time - 1; // stop one element before the boundary
      for (int time_index = cur_time_index; time_index < (spike_time / 2) + 1; time_index++)
      {
         temp_profile.temp_targets[time_index] = target_temp;
      }
      // undo extra increment of for loop
      cur_time_index = (spike_time / 2);
   }
   else
   {
      for (int time_index = cur_time_index; time_index < (spike_time / 2) + 1; time_index++)
      {
         temp_profile.temp_targets[time_index] = target_temp;
      }
      // undo extra increment of for loop
      cur_time_index = (spike_time / 2);
   }

   // increment the index by one
   cur_time_index = cur_time_index + 1;

   // fill the elements for the spike period
   //  temperature increases 1 degree per second
   if (cooling_time % 2 != 0)
   {
      // the cooling time boundary is an odd number
      cooling_time = cooling_time - 1; // stop one element before the boundary
      for (int time_index = cur_time_index; time_index < (cooling_time / 2) + 1; time_index++)
      {
         target_temp = target_temp + 2;
         temp_profile.temp_targets[time_index] = target_temp;
      }
      // undo extra increment of for loop
      cur_time_index = (cooling_time / 2);
   }
   else
   {
      for (int time_index = cur_time_index; time_index < (cooling_time / 2) + 1; time_index++)
      {
         target_temp = target_temp + 2;
         temp_profile.temp_targets[time_index] = target_temp;
      }
      // undo extra increment of for loop
      cur_time_index = (cooling_time / 2);
   }
   // increment the index by one
   cur_time_index = cur_time_index + 1;
   // fill the remaining elements for the cooling period
   // temperature will decrease at 2 degrees per second
   for (int time_index = cur_time_index; time_index < 181; time_index++)
   {
      target_temp = target_temp - 4;
      temp_profile.temp_targets[time_index] = target_temp;
   }
   // undo extra increment of for loop
   cur_time_index = 181;
   return temp_profile;
}

struct profile generate_test_profile(struct profile temp_profile){
   for (int i=0; i<180; i++){
      temp_profile.temp_targets[i] = 100;
   }
   return temp_profile;
}

// In main.cpp this is how you would call the function and create an array of different profiles
// struct profile profile_list[3];
// struct profile profile1;
// struct profile profile2;
// struct profile profile3;
// profile1 = generate_RSS_profile(profile1, 75, 165, 240);
// profile2 = generate_RSS_profile(profile1, 80, 165, 220);
// profile3 = generate_RSS_profile(profile1, 90, 152, 240);
// profile_list[0] = profile1;
// profile_list[1] = profile2;
// profile_list[2] = profile3;
// This program is used for generating reflow temperature profiles

unsigned int *generate_RSS_profile(unsigned int soak_time, unsigned int spike_time, unsigned int cooling_time)
{
   // RSS is a Ramp, Soak, Spike profile that has 4 regions
   // 1: Preheating zone, 2: Soak zone, 3: Reflow zone (spike), 4: Cooling Zone
   // each array element holds the target temperature every 2 seconds
   // need to be able to handle the case where the boundary times are odd numbers
   unsigned int temp_targets[180];
   unsigned int target_temp = 25; // assume that the starting temperature is 22 degrees
   unsigned int time_index = 1;
   temp_targets[0] = target_temp;
   // fill the elements for the ramp period
   if (soak_time % 2 != 0)
   {
      // the soak time boundary is an odd number
      soak_time = soak_time + 1; // stop one element after the boundary
      for (time_index; time_index < (soak_time / 2) + 1; time_index++)
      {
         // the temperature increases by 2 degrees per second in this zone
         target_temp = target_temp + 4;
         temp_targets[time_index] = target_temp;
      }
      // since the boundary is an odd number, have overshot by 2 degrees
      time_index = time_index - 1; // undo the extra increment from for loop
      target_temp = target_temp - 2;
      temp_targets[time_index] = target_temp;
   }
   else
   {
      for (time_index; time_index < (soak_time / 2) + 1; time_index++)
      {
         target_temp = target_temp + 4;
         temp_targets[time_index] = target_temp;
      }
      // undo extra increment of for loop
      time_index = time_index - 1;
   }
   // fill the elements for the soak period
   //  this region remains a constant target temperature
   if (spike_time % 2 != 0)
   {
      // the spike time boundary is an odd number
      spike_time = spike_time - 1; // stop one element before the boundary
      for (time_index; time_index < (spike_time / 2) + 1; time_index++)
      {
         temp_targets[time_index] = target_temp;
      }
      // undo extra increment of for loop
      time_index = time_index - 1;
   }
   else
   {
      for (time_index; time_index < (spike_time / 2) + 1; time_index++)
      {
         temp_targets[time_index] = target_temp;
      }
      // undo extra increment of for loop
      time_index = time_index - 1;
   }

   // increment the index by one
   time_index = time_index + 1;

   // fill the elements for the spike period
   //  temperature increases 1 degree per second
   if (cooling_time % 2 != 0)
   {
      // the cooling time boundary is an odd number
      cooling_time = cooling_time - 1; // stop one element before the boundary
      for (time_index; time_index < (cooling_time / 2) + 1; time_index++)
      {
         target_temp = target_temp + 2;
         temp_targets[time_index] = target_temp;
      }
      // undo extra increment of for loop
      time_index = time_index - 1;
   }
   else
   {
      for (time_index; time_index < (cooling_time / 2) + 1; time_index++)
      {
         target_temp = target_temp + 2;
         temp_targets[time_index] = target_temp;
      }
      // undo extra increment of for loop
      time_index = time_index - 1;
   }
   // increment the index by one
   time_index = time_index + 1;
   // fill the remaining elements for the cooling period
   // temperature will decrease at 2 degrees per second
   for (time_index; time_index < 181; time_index++)
   {
      target_temp = target_temp - 4;
      temp_targets[time_index] = target_temp;
   }
   // undo extra increment of for loop
   time_index = time_index - 1;

   return temp_targets;
}

//In main.cpp this is how you would call the function
// int *temp_profile;
// temp_profile = generate_RSS_profile(75, 165, 240);
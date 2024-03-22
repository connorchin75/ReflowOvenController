// This program is used for generating reflow temperature profiles

struct profile {
    volatile unsigned int temp_targets[141];
};

void generate_RSS_profile(struct profile* temp_profile, unsigned int time1, unsigned int time2, unsigned int time3, unsigned int step1, unsigned int step2, unsigned int step3){

    unsigned int target_temp = 25;
    unsigned int cur_time_index = 1;
    (*temp_profile).temp_targets[0] = target_temp;
    target_temp = target_temp + step1;
    
    
    //fill the array with the first ramp temperature values
    for (int i=cur_time_index; i<((time1/2)+1); i++){
        (*temp_profile).temp_targets[cur_time_index] = target_temp;
        cur_time_index = cur_time_index + 1;
        target_temp = target_temp + step1;
        xpd_echo_int(target_temp, XPD_Flag_UnsignedDecimal);
        xpd_puts(" \n");
    }
    //undo the current temp by the previous step size and add the new step size
    target_temp = target_temp - step1;
    target_temp = target_temp + step2;
    //fill the array with the second ramp temperature values
    for (int i=cur_time_index; i<((time2/2)+1); i++){
        (*temp_profile).temp_targets[cur_time_index] = target_temp;
        cur_time_index = cur_time_index + 1;
        target_temp = target_temp + step2;
    }
    //undo the current temp by the previous step size and add the new step size
    target_temp = target_temp - step2;
    target_temp = target_temp + step3;
    //fill the array with the third ramp temperature values
    for (int i=cur_time_index; i<((time3/2)+1); i++){
        (*temp_profile).temp_targets[cur_time_index] = target_temp;
        cur_time_index = cur_time_index + 1;
        target_temp = target_temp + step3;
    }
    //undo the current temp by the previous step size
    target_temp = target_temp - step3;
    // Add three more max temp readings to allow for the oven reach the peak temp
    for (int i=cur_time_index; i<((time3/2)+4); i++){
        (*temp_profile).temp_targets[cur_time_index] = target_temp;
        cur_time_index = cur_time_index + 1;
    }
    target_temp = target_temp - 5;
    //fill the remaining elements with 25 degrees celsius
    for (int i=cur_time_index; i<141; i++){
        (*temp_profile).temp_targets[cur_time_index] = target_temp;
        cur_time_index = cur_time_index + 1;
        target_temp = target_temp - 5;
    }
}

struct profile generate_test_profile(struct profile temp_profile){
   for (int i=0; i<180; i++){
      temp_profile.temp_targets[i] = 0;
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
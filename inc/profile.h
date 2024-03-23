// This program is used for generating reflow temperature profiles

struct profile {
    volatile unsigned int temp_targets[141];
};

void generate_RSS_profile1(struct profile* temp_profile){
    unsigned int time1 = 30;
    unsigned int time2 = 120;
    unsigned int time3 = 210;
    unsigned int step1 = 5;
    unsigned int step2 = 1;
    unsigned int step3 = 2;

    unsigned int target_temp = 25;
    unsigned int cur_time_index = 1;
    (*temp_profile).temp_targets[0] = target_temp;
    target_temp = target_temp + step1;
    
    
    //fill the array with the first ramp temperature values
    for (int i=cur_time_index; i<((time1/2)+1); i++){
        (*temp_profile).temp_targets[cur_time_index] = target_temp;
        cur_time_index = cur_time_index + 1;
        target_temp = target_temp + step1;
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

void generate_RSS_profile2(struct profile* temp_profile){
    unsigned int time1 = 90;
    unsigned int time2 = 180;
    unsigned int time3 = 240;
    unsigned int step1 = 3;
    unsigned int step2 = 0;
    unsigned int step3 = 3;

    unsigned int target_temp = 25;
    unsigned int cur_time_index = 1;
    (*temp_profile).temp_targets[0] = target_temp;
    target_temp = target_temp + step1;
    
    
    //fill the array with the first ramp temperature values
    for (int i=cur_time_index; i<((time1/2)+1); i++){
        (*temp_profile).temp_targets[cur_time_index] = target_temp;
        cur_time_index = cur_time_index + 1;
        target_temp = target_temp + step1;
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

void generate_RSS_profile3(struct profile* temp_profile){
    unsigned int time1 = 90;
    unsigned int time2 = 180;
    unsigned int time3 = 232;
    unsigned int step1 = 2;
    unsigned int step2 = 0;
    unsigned int step3 = 2;

    unsigned int target_temp = 25;
    unsigned int cur_time_index = 1;
    (*temp_profile).temp_targets[0] = target_temp;
    target_temp = target_temp + step1;
    
    
    //fill the array with the first ramp temperature values
    for (int i=cur_time_index; i<((time1/2)+1); i++){
        (*temp_profile).temp_targets[cur_time_index] = target_temp;
        cur_time_index = cur_time_index + 1;
        target_temp = target_temp + step1;
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
#!/bin/bash

# Function definitions

# Function to create log file with date-time stamp
create_log_file() {
    local mode=$1
    local subsystem=$2
    local log_file=""

    case $mode in
        "subsystem")
            log_file="${subsystem}_$(date +"%Y%m%d_%H%M%S").log"
            ;;
        "validation")
            log_file="TC_TM_validation_$(date +"%Y%m%d_%H%M%S").log"
            ;;
        "loop")
            log_file="Long_run_$(date +"%Y%m%d_%H%M%S").log"
            ;;
        "bringup")
            log_file="Bringup_${subsystem}_$(date +"%Y%m%d_%H%M%S").log"
            ;;
        *)
            echo "Invalid mode provided for log file creation."
            exit 1
            ;;
    esac

    echo "$log_file"
}

# Function to print initial documentation
print_initial_documentation() {
    local start_date=$(date +"%Y-%m-%d")
    local start_time=$(date +"%H:%M:%S")
    local location="Hyderabad Xdlinx Labs"
   # local test_software=
    read -p "Test software version: " test_software


    echo "========================================================="
    echo "		   Test Documentation			"
    echo "========================================================="
    echo "Test date: $start_date"
    echo "Test time: $start_time"
    echo "Location: $location"
    echo "Test software: $test_software"
    echo "*****************Test Starts in 5 seconds ***********************"
	seconds=5
	# Loop until the counter reaches 0
	while [ $seconds -gt 0 ]; do
	  echo "$seconds seconds to begin test....."
	  sleep 1
	  seconds=$((seconds - 1))
	done
}

# Function to print termination documentation
print_termination_documentation() {
    local start_time=$1
    local log_file=$2
    local end_time=$(date +"%H:%M:%S")
    local start_seconds=$(date -d "$start_time" +%s)
    local end_seconds=$(date -d "$end_time" +%s)
    local total_seconds=$((end_seconds - start_seconds))
    local total_time=$(printf "%02d:%02d:%02d" $((total_seconds/3600)) $((total_seconds%3600/60)) $((total_seconds%60)))

    echo "========================================================"
    echo "		    Test Termination			"
    echo "========================================================"
    echo "Start time: $start_time"
    echo "End time: $end_time"
    echo "Total Duration of test:"$total_time
    echo "Log file: $log_file"
    echo "========================================================"
}

# Function to handle subsystem EPS commands
eps() {
        echo "****************|EPS TC_TM Begins|*********************"
    { sleep 2; 
      echo 4; 
      	      sleep 1; echo 11; sleep 1; echo 200; sleep 3;   
      	      sleep 1; echo 11; sleep 1; echo 201; sleep 1; echo 1; sleep 2;
      	      sleep 1; echo 11; sleep 1; echo 201; sleep 1; echo 0; sleep 2; 
      	      sleep 1; echo 11; sleep 1; echo 202; sleep 3; 
      	      sleep 1; echo 11; sleep 1; echo 203; sleep 3; 
      	    #  sleep 1; echo 11; sleep 1; echo 204; sleep 3; echo 1\n; sleep 1; echo 1\n; sleep 1; echo 1\n; sleep 1; echo 1\n; sleep 1; echo 1\n; sleep 1; echo 1\n; sleep 1; echo 1\n; sleep 1; echo 1\n; sleep 1; echo 1\n; sleep 1; echo 1\n; sleep 1; echo 1\n; sleep 1; echo 1\n; sleep 2;
      	      sleep 1; echo 11; sleep 1; echo 205; sleep 3; 
      	      sleep 1; echo 11; sleep 1; echo 206; sleep 3; echo 0; sleep 2;
      	      sleep 1; echo 11; sleep 1; echo 206; sleep 3; echo 1; sleep 2;
      	      sleep 1; echo 11; sleep 1; echo 206; sleep 3; echo 2; sleep 2;
      	      sleep 1; echo 11; sleep 1; echo 207; sleep 3; 
      	      sleep 1; echo 11; sleep 1; echo 208; sleep 3; 
      	      sleep 1; echo 11; sleep 1; echo 209; sleep 3;
      	      sleep 1; echo 11; sleep 1; echo 210; sleep 3;
      	      sleep 1; echo 11; sleep 1; echo 211; sleep 3; echo 13; sleep 1; echo 1; sleep 2;
      	      sleep 1; echo 11; sleep 1; echo 215; sleep 3;
      	      sleep 1; echo 11; sleep 1; echo 222; sleep 3;  
      sleep 1; echo 17; } | ./mfcc_sample_app
    echo "****************|EPS TC_TM Test End|************************"
}

# Function to handle subsystem OBC commands
obc() {
    echo "Running OBC subsystem..."
    { sleep 2;
      echo 4; sleep 1; echo 11; sleep 1; echo 500; sleep 5;
      sleep 1; echo 17; } | ./mfcc_sample_app
}

# Function to handle subsystem ADCS commands
adcs() {
    echo "Running ADCS subsystem..."
    { sleep 2;
      echo 4; sleep 1; echo 11; sleep 1; echo 505; sleep 5;
      sleep 1; echo 17; } | ./mfcc_sample_app
}

# Function to handle subsystem Sensors commands
sensors() {
    echo "Running Sensors subsystem..."
    { sleep 2;
      echo 4; sleep 1; echo 11; sleep 1; echo 501; sleep 5;
      sleep 1; echo 17; } | ./mfcc_sample_app
}

# Function to handle subsystem UHF commands
uhf() {
    echo "Running UHF subsystem..."
    { sleep 2;
      echo 4; sleep 1; echo 11; sleep 1; echo 503; sleep 5;
      sleep 1; echo 17; } | ./mfcc_sample_app
}

# Function to handle subsystem S-band commands
sband() {
    echo "Running S-band subsystem..."
    { sleep 2;
      echo 4; sleep 1; echo 11; sleep 1; echo 502; sleep 5;
      sleep 1; echo 17; } | ./mfcc_sample_app
}

# Function to handle subsystem FTM commands
ftm() {
    echo "Running FTM subsystem..."
    { sleep 2;
      echo 4; sleep 1; echo 11; sleep 1; echo 504; sleep 5;
      sleep 1; echo 17; } | ./mfcc_sample_app
}

# Function to handle subsystem GPS commands
gps() {
    echo "Running GPS subsystem..."
    { sleep 2;
      echo 4; sleep 1; echo 11; sleep 1; echo 510; sleep 5;
      sleep 1; echo 17; } | ./mfcc_sample_app
}

# Function to handle subsystem Scheduler commands
scheduler() {
    echo "Running Scheduler subsystem..."
    { sleep 2;
      echo 4; sleep 1; echo 11; sleep 1; echo 506; sleep 5;
      sleep 1; echo 17; } | ./mfcc_sample_app
}

# Function to handle extra subsystem commands
extra() {
    echo "Running Extra subsystem..."
    { sleep 2;
      echo 4; sleep 1; echo 11; sleep 1; echo 507; sleep 5;
      sleep 1; echo 17; } | ./mfcc_sample_app
}

# Function to run all subsystems once for validation
run_validation() {
    log_file=$(create_log_file "validation")
    print_initial_documentation | tee -a "$log_file"
    
    eps | tee -a "$log_file"
    obc | tee -a "$log_file"
    adcs | tee -a "$log_file"
    sensors | tee -a "$log_file"
    uhf | tee -a "$log_file"
    sband | tee -a "$log_file"
    ftm | tee -a "$log_file"
    gps | tee -a "$log_file"
    scheduler | tee -a "$log_file"
    extra | tee -a "$log_file"
    
    print_termination_documentation "$start_time" "$log_file"| tee -a "$log_file"
}

##############################
# Function to run subsystem tests in an infinite loop with an iteration count and a 60-second wait between iterations
run_loop() {
    local iterations=$1
    local iteration_count=0
    log_file=$(create_log_file "loop")
    print_initial_documentation | tee -a "$log_file"
    
    while true; do
        iteration_count=$((iteration_count + 1))
        echo "Iteration $iteration_count:" | tee -a "$log_file"
        
        eps | tee -a "$log_file"
        obc | tee -a "$log_file"
        adcs | tee -a "$log_file"
        sensors | tee -a "$log_file"
        uhf | tee -a "$log_file"
        sband | tee -a "$log_file"
        ftm | tee -a "$log_file"
        gps | tee -a "$log_file"
        scheduler | tee -a "$log_file"
        extra | tee -a "$log_file"
        
        if [[ $iterations -gt 0 && $iteration_count -ge $iterations ]]; then
            break
        fi
        
        echo "***************Waiting for 60 seconds before next iteration...**************************"
        sleep 60
    done
    
    print_termination_documentation "$start_time" "$log_file"| tee -a "$log_file"
}
#############################3
# Function to run subsystem tests in an infinite loop with an iteration count

# Function to bring up OBC subsystem
bringup_obc() {
    echo "Bringing up OBC subsystem..."
    { sleep 2;
      echo 4; sleep 1; echo 1; sleep 1; echo 500; sleep 5;
      sleep 1; echo 17; } | ./mfcc_sample_app
}

# Function to bring up PS board
bringup_ps_board() {
    echo "Bringing up PS board..."
    { sleep 2;
      echo 4; sleep 1; echo 1; sleep 1; echo 501; sleep 5;
      sleep 1; echo 17; } | ./mfcc_sample_app
}

# Function to bring up Edge board
bringup_edge_board() {
    echo "Bringing up Edge board..."
    { sleep 2;
      echo 4; sleep 1; echo 11; sleep 1; echo 200; sleep 5;
      sleep 1; echo 17; } | ./mfcc_sample_app
}

# Function to bring up GPS board
bringup_gps_board() {
    echo "Bringing up GPS board..."
    { sleep 2;
      echo 4; sleep 1; echo 11; sleep 1; echo 209; sleep 5;
      sleep 1; echo 17; } | ./mfcc_sample_app
}

# Function to bring up Memory
bringup_memory() {
    echo "Bringing up Memory..."
    { sleep 2;
      echo 4; sleep 1; echo 11; sleep 1; echo 208; sleep 5;
      sleep 1; echo 17; } | ./mfcc_sample_app
}


bringup_all_boards() {
    local start_time=$(date +"%H:%M:%S")
    log_file=$(create_log_file "bringup" "All_Boards")
    print_initial_documentation | tee -a "$log_file"

    bringup_obc | tee -a "$log_file"
    bringup_ps_board | tee -a "$log_file"
    bringup_edge_board | tee -a "$log_file"
    bringup_gps_board | tee -a "$log_file"
    bringup_memory | tee -a "$log_file"

    print_termination_documentation "$start_time" "$log_file"| tee -a "$log_file"
}

# Main script logic
clear
echo "=============================================================="
echo "	    Welcome to Subsystem Testing and Bringup	   "
echo "=============================================================="
echo "Select a mode:"
echo "1. Subsystem Mode"
echo "2. Validation Mode"
echo "3. Loop Mode"
echo "4. Bringup Mode"
echo "5. Exit"

read -p "Enter your choice: " mode_choice

start_time=$(date +"%H:%M:%S")

case $mode_choice in
    1) 
        clear
        echo "Select a subsystem to test:"
        echo "1. EPS"
        echo "2. OBC"
        echo "3. ADCS"
        echo "4. Sensors"
        echo "5. UHF"
        echo "6. S-band"
        echo "7. FTM"
        echo "8. GPS"
        echo "9. Scheduler"
        echo "10. Extra"
        echo "11. Return to main menu"

        read -p "Enter your choice: " subsystem_choice

        case $subsystem_choice in
            1) log_file=$(create_log_file "subsystem" "EPS"); print_initial_documentation | tee -a "$log_file"; eps | tee -a "$log_file" ;;
            2) log_file=$(create_log_file "subsystem" "OBC"); print_initial_documentation | tee -a "$log_file"; obc | tee -a "$log_file" ;;
            3) log_file=$(create_log_file "subsystem" "ADCS"); print_initial_documentation | tee -a "$log_file"; adcs | tee -a "$log_file" ;;
            4) log_file=$(create_log_file "subsystem" "Sensors"); print_initial_documentation | tee -a "$log_file"; sensors | tee -a "$log_file" ;;
            5) log_file=$(create_log_file "subsystem" "UHF"); print_initial_documentation | tee -a "$log_file"; uhf | tee -a "$log_file" ;;
            6) log_file=$(create_log_file "subsystem" "S-band"); print_initial_documentation | tee -a "$log_file"; sband | tee -a "$log_file" ;;
            7) log_file=$(create_log_file "subsystem" "FTM"); print_initial_documentation | tee -a "$log_file"; ftm | tee -a "$log_file" ;;
            8) log_file=$(create_log_file "subsystem" "GPS"); print_initial_documentation | tee -a "$log_file"; gps | tee -a "$log_file" ;;
            9) log_file=$(create_log_file "subsystem" "Scheduler"); print_initial_documentation | tee -a "$log_file"; scheduler | tee -a "$log_file" ;;
            10) log_file=$(create_log_file "subsystem" "Extra"); print_initial_documentation | tee -a "$log_file"; extra | tee -a "$log_file" ;;
            11) echo "Returning to main menu..." ;;
            *) echo "Invalid option. Please enter a number from 1 to 11." ;;
        esac
        print_termination_documentation "$start_time" "$log_file" "subsystem" | tee -a "$log_file" ;;
    2) run_validation ;;
    3) run_loop "$iterations" ;;
    4) 
        echo "Select a bringup option:"
        echo "1. OBC"
        echo "2. PS board"
        echo "3. Edge board"
        echo "4. GPS board"
        echo "5. Memory"
        echo "6. All boards"
        echo "7. Return to main menu"

        read -p "Enter your choice: " bringup_choice

        case $bringup_choice in
            1) log_file=$(create_log_file "bringup" "OBC"); print_initial_documentation | tee -a "$log_file"; bringup_obc | tee -a "$log_file" ;;
            2) log_file=$(create_log_file "bringup" "PS_board"); print_initial_documentation | tee -a "$log_file"; bringup_ps_board | tee -a "$log_file" ;;
            3) log_file=$(create_log_file "bringup" "Edge_board"); print_initial_documentation | tee -a "$log_file"; bringup_edge_board | tee -a "$log_file" ;;
            4) log_file=$(create_log_file "bringup" "GPS_board"); print_initial_documentation | tee -a "$log_file"; bringup_gps_board | tee -a "$log_file" ;;
            5) log_file=$(create_log_file "bringup" "Memory"); print_initial_documentation | tee -a "$log_file"; bringup_memory | tee -a "$log_file" ;;

            6) bringup_all_boards;;
					#log_file=$(create_log_file "bringup" "All_boards"); print_initial_documentation | tee -a "$log_file"; bringup_all_boards | tee -a "$log_file" ;;
            7) echo "Returning to main menu..." ;;
            *) echo "Invalid option. Please enter a number from 1 to 7." ;;
        esac
        print_termination_documentation "$start_time" "$log_file" "bringup"| tee -a "$log_file" ;;
    
    5) echo "Exiting script." ;;
    *) echo "Invalid option. Please enter a number from 1 to 5." ;;
esac

exit 0

echo 'This is a test script.'

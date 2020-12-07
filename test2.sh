#!/bin/bash
#run "chmod u+x test.sh"
echo "gcc -Wall saxpy-v0.c -o saxpy-v0.out -lpthread"
gcc -Wall saxpyP.c -o saxpy-v0.out -lpthread

echo "gcc -Wall saxpy.c -o saxpy.out -lpthread"
gcc -Wall saxpy.c -o saxpy.out -lpthread


GREEN='\033[0;32m'
NC='\033[0m'
printf "${GREEN}Please be patient, this may take a while...${NC}\n"

# 10 repeticiones para -i 1 -n [1_NT, 1,2,4,8]
printf "${GREEN}Doing 10 iterations for -i 1 -n [1_NT,1,2,4,8]${NC}\n"
for i in {1..10}; do
    echo "Repeticion $i" >> "SAXPY_NT_i1.txt"
    ./saxpy.out -i 1 -n 1 >> "SAXPY_NT_i1.txt"
    echo "" >> "SAXPY_NT_i1.txt"

    echo "Repeticion $i" >> "SAXPY_T_i1_n1.txt"
    ./saxpy-v0.out -i 1 -n 1 >> "SAXPY_T_i1_n1.txt"
    echo "" >> "SAXPY_T_i1_n1.txt"

    echo "Repeticion $i" >> "SAXPY_T_i1_n2.txt"
    ./saxpy-v0.out -i 1 -n 2 >> "SAXPY_T_i1_n2.txt"
    echo "" >> "SAXPY_T_i1_n2.txt"

    echo "Repeticion $i" >> "SAXPY_T_i1_n4.txt"
    ./saxpy-v0.out -i 1 -n 4 >> "SAXPY_T_i1_n4.txt"
    echo "" >> "SAXPY_T_i1_n4.txt"

    echo "Repeticion $i" >> "SAXPY_T_i1_n8.txt"
    ./saxpy-v0.out -i 1 -n 8 >> "SAXPY_T_i1_n8.txt"
    echo "" >> "SAXPY_T_i1_n8.txt"
done

# 10 repeticiones para -i 10 -n [1_NT, 1,2,4,8]
printf "${GREEN}Doing 10 iterations for -i 10 -n [1_NT,1,2,4,8]${NC}\n"
for i in {1..10}; do
    echo "Repeticion $i" >> "SAXPY_NT_i10.txt"
    ./saxpy.out -i 10 -n 1 >> "SAXPY_NT_i10.txt"
    echo "" >> "SAXPY_NT_i10.txt"

    echo "Repeticion $i" >> "SAXPY_T_i10_n1.txt"
    ./saxpy-v0.out -i 10 -n 1 >> "SAXPY_T_i10_n1.txt"
    echo "" >> "SAXPY_T_i10_n1.txt"

    echo "Repeticion $i" >> "SAXPY_T_i10_n2.txt"
    ./saxpy-v0.out -i 10 -n 2 >> "SAXPY_T_i10_n2.txt"
    echo "" >> "SAXPY_T_i10_n2.txt"

    echo "Repeticion $i" >> "SAXPY_T_i10_n4.txt"
    ./saxpy-v0.out -i 10 -n 4 >> "SAXPY_T_i10_n4.txt"
    echo "" >> "SAXPY_T_i10_n4.txt"

    echo "Repeticion $i" >> "SAXPY_T_i10_n8.txt"
    ./saxpy-v0.out -i 10 -n 8 >> "SAXPY_T_i10_n8.txt"
    echo "" >> "SAXPY_T_i10_n8.txt"
done

# 10 repeticiones para -i 50 -n [1_NT, 1,2,4,8]
printf "${GREEN}Doing 10 iterations for -i 50 -n [1_NT,1,2,4,8]${NC}\n"
for i in {1..10}; do
    echo "Repeticion $i" >> "SAXPY_NT_i50.txt"
    ./saxpy.out -i 50 -n 1 >> "SAXPY_NT_i50.txt"
    echo "" >> "SAXPY_NT_i50.txt"

    echo "Repeticion $i" >> "SAXPY_T_i50_n1.txt"
    ./saxpy-v0.out -i 50 -n 1 >> "SAXPY_T_i50_n1.txt"
    echo "" >> "SAXPY_T_i50_n1.txt"

    echo "Repeticion $i" >> "SAXPY_T_i50_n2.txt"
    ./saxpy-v0.out -i 50 -n 2 >> "SAXPY_T_i50_n2.txt"
    echo "" >> "SAXPY_T_i50_n2.txt"

    echo "Repeticion $i" >> "SAXPY_T_i50_n4.txt"
    ./saxpy-v0.out -i 50 -n 4 >> "SAXPY_T_i50_n4.txt"
    echo "" >> "SAXPY_T_i50_n4.txt"

    echo "Repeticion $i" >> "SAXPY_T_i50_n8.txt"
    ./saxpy-v0.out -i 50 -n 8 >> "SAXPY_T_i50_n8.txt"
    echo "" >> "SAXPY_T_i50_n8.txt"
done

printf "${GREEN}...Maybe more than just a while...${NC}\n"
# 10 repeticiones para -i 100 -n [1_NT, 1,2,4,8]
printf "${GREEN}Doing 10 iterations for -i 100 -n [1_NT,1,2,4,8]${NC}\n"
for i in {1..10}; do
    echo "Repeticion $i" >> "SAXPY_NT_i100.txt"
    ./saxpy.out -i 100 -n 1 >> "SAXPY_NT_i100.txt"
    echo "" >> "SAXPY_NT_i100.txt"

    echo "Repeticion $i" >> "SAXPY_T_i100_n1.txt"
    ./saxpy-v0.out -i 100 -n 1 >> "SAXPY_T_i100_n1.txt"
    echo "" >> "SAXPY_T_i100_n1.txt"

    echo "Repeticion $i" >> "SAXPY_T_i100_n2.txt"
    ./saxpy-v0.out -i 100 -n 2 >> "SAXPY_T_i100_n2.txt"
    echo "" >> "SAXPY_T_i100_n2.txt"

    echo "Repeticion $i" >> "SAXPY_T_i100_n4.txt"
    ./saxpy-v0.out -i 100 -n 4 >> "SAXPY_T_i100_n4.txt"
    echo "" >> "SAXPY_T_i100_n4.txt"

    echo "Repeticion $i" >> "SAXPY_T_i100_n8.txt"
    ./saxpy-v0.out -i 100 -n 8 >> "SAXPY_T_i100_n8.txt"
    echo "" >> "SAXPY_T_i100_n8.txt"
done


printf "${GREEN}...Maybe you should turn off the Automatic Screen Lock...${NC}\n"
# 10 repeticiones para -i 500 -n [1_NT, 1,2,4,8]
printf "${GREEN}Doing 10 iterations for -i 500 -n [1_NT,1,2,4,8]${NC}\n"
for i in {1..10}; do
    echo "Repeticion $i" >> "SAXPY_NT_i500.txt"
    ./saxpy.out -i 500 -n 1 >> "SAXPY_NT_i500.txt"
    echo "" >> "SAXPY_NT_i500.txt"

    echo "Repeticion $i" >> "SAXPY_T_i500_n1.txt"
    ./saxpy-v0.out -i 500 -n 1 >> "SAXPY_T_i500_n1.txt"
    echo "" >> "SAXPY_T_i500_n1.txt"

    echo "Repeticion $i" >> "SAXPY_T_i500_n2.txt"
    ./saxpy-v0.out -i 500 -n 2 >> "SAXPY_T_i500_n2.txt"
    echo "" >> "SAXPY_T_i500_n2.txt"

    echo "Repeticion $i" >> "SAXPY_T_i500_n4.txt"
    ./saxpy-v0.out -i 500 -n 4 >> "SAXPY_T_i500_n4.txt"
    echo "" >> "SAXPY_T_i500_n4.txt"

    echo "Repeticion $i" >> "SAXPY_T_i500_n8.txt"
    ./saxpy-v0.out -i 500 -n 8 >> "SAXPY_T_i500_n8.txt"
    echo "" >> "SAXPY_T_i500_n8.txt"
done

# 10 iteraciones para -i 1000 -n [1_NT,1,2,4,8] version paralela y secuencial
printf "${GREEN}Doing 10 iterations for -i 1000 -n [1_NT,1,2,4,8]${NC}\n"
for i in {1..10}; do
    case $i in
    1)
        echo "You know you can stop this anytime you want, right?"
        ;;
    2)
        echo "Get up and go feed or walk your pets"
        ;;
    3)
        echo "Why don't you call that friend you haven't talked to in a long time?"
        ;;    
    4)
        echo "This is going to last longer than you and your crush"
        ;;
    5)
        echo "Nope, not yet"
        ;;
    6)
        echo "Go say hi to the people you live with"
        ;;
    7)
        echo "Let's do some exercise, push ups till the next iteration"
        ;;
    8)
        echo "Squats till next"
        ;;
    9)
        echo "Crunches till next one"
        ;;
    10)
        echo "Now go get some shower you pig"
        ;;                            
    *)
        echo "Error?"
        ;;
    esac
    echo "Repeticion $i" >> "SAXPY_NT_i1000.txt"
    ./saxpy.out -i 1000 >> "SAXPY_NT_i1000.txt"
    echo "" >> "SAXPY_NT_i1000.txt"

    echo "Repeticion $i" >> "SAXPY_T_i1000_n1.txt"
    ./saxpy-v0.out -i 1000 -n 1 >> "SAXPY_T_i1000_n1.txt"
    echo "" >> "SAXPY_T_i1000_n1.txt"

    echo "Repeticion $i" >> "SAXPY_T_i1000_n2.txt"
    ./saxpy-v0.out -i 1000 -n 2 >> "SAXPY_T_i1000_n2.txt"
    echo "" >> "SAXPY_T_i1000_n2.txt"    

    echo "Repeticion $i" >> "SAXPY_T_i1000_n4.txt"
    ./saxpy-v0.out -i 1000 -n 4 >> "SAXPY_T_i1000_n4.txt"
    echo "" >> "SAXPY_T_i1000_n4.txt"

        echo "Repeticion $i" >> "SAXPY_T_i1000_n8.txt"
    ./saxpy-v0.out -i 1000 -n 8 >> "SAXPY_T_i1000_n8.txt"
    echo "" >> "SAXPY_T_i1000_n8.txt"

done

printf "${GREEN}Done${NC}\n"

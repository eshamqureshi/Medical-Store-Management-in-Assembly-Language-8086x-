;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                                                                                 ;
;                                                                                                                                                 ;
;                                                                                                                                                 ;
;                                                                                                                                                 ;
;                                                                                                                                                 ;
;                                                       Muhammad Esham Qureshi                                                                    ;
;                                                              36511                                                                              ;
;                                                                                                                                                 ;
;                                                                                                                                                 ;
;                                                                                                                                                 ;
;                                                                                                                                                 ;
;                                                                                                                                                 ;
;                                                                                                                                                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



.model large

.stack 100h

.data                                                                            ;data section
        
                                                                                    
   input_password db 10,13, 'Please Enter the  Password$'                          ;variables for password portion
   password db 'esham$'                                                            ;password is already define / hardcoded
   incorrect_password db 10,13, '      <!>You enterd an Incorrect Password<!>$'               ; 10,13 will take to start of  next line
                          
                          
                          
    welcome1      db 10,13,10,13,'         =================================================$'                           ;name of project or name or store     
    welcome2      db 10,13,      '       ||                                                 ||$'
    welcome3       db 10,13,     '       ||                                                 ||$'                         ; wellcome message 
    welcome4       db 10,13,     '       ||       WELCOME TO RIPHAH MEDICAL STORE           ||$'
    welcome5       db 10,13,     '       ||                                                 ||$'   
    welcome6       db 10,13,     '       ||                                                 ||$'
    welcome7       db 10,13,     '         =================================================$'
                         
                         
                         
   
   msg1 db 10,13,10,13, 'Choose any Option$'
   msg2 db 10,13,10,13, 'What Do You Want To Buy$'
   msg_medicines db 10,13, 'Press 1 to buy medicines$'                            ;messages for front menu
   medicines_sold db 10,13, 'Press 2 to see medicines statistics$'                ; contaion alll the message of main menu
   input_again db 10,13, 'Please Press one of the above given keys$'
   wrong_input db 10,13, '          <!>Wrong Input<!>$'
   exit_program db 10,13,'Press 4 to exit$'   
                           
                           
   
   
   opt1 db 10,13, '1. Panadol - 4rs$'
   opt2 db 10,13, '2. Paracetamol - 3rs$'
   opt3 db 10,13, '3. Cleritek - 2rs$'
   opt4 db 10,13, '4. Aspirin - 2rs$'                                             ;messsages for the inner menu of medicine
   opt5 db 10,13, '5. Brufen - 1rs$'
   opt6 db 10,13, '6. Surbex Z - 3rs$'
   opt7 db 10,13, '7. Arinac - 4rs$'
   opt8 db 10,13, '8. Sinopharm Vaccine - 2rs$'
   opt9 db 10,13, '9. Pfizer Vaccine - 4rs$' 
   
                           
                           
                                                                                  ;variable to move to next line
   newLine db 10,13, '$'                                                          ;no need to write 6 line again and again in code 
   
     
                              
                              
                              
   msg_panadol db 10,13, 'How many panadols do you want to buy$'                  ;message which will ask user how many medicine he/she want to buy
   msg_paracetamol db 10,13, 'How many paracetamol do you want to buy$'
   msg_cleritek db 10,13, 'How many cleritek do you want to buy$'                 ;seprate message for each medicine
   msg_aspirin db 10,13, 'How many aspirin do you want to buy$'
   msg_brufen db 10,13, 'How many brufen do you want to buy$'
   msg_surbex db 10,13, 'How many subex do you want to buy$'
   msg_arinac db 10,13, 'How many arinac do you want to buy$'
   msg_sinopharm db 10,13, 'How many Sinopharm Vaccine do you want to buy$'
   msg_pfizer db 10,13, 'How many Pfizer Vaccine do you want to buy$' 
   
                                   
                                   
                                   
                                                                                    
   total_msg dw 'Total Earned= $'                                                  ;message show in amount earned after last sell
   
                                   
                                   
                                   
   
   price_panadol dw 4
   price_paracetamol dw 3
   price_cleritek dw 2    
   price_aspirin dw 2
   price_brufen dw 1                                                              ; message in which price of medicine are store
   price_surbex dw 3                                                              ; different prices of different medicine 
   price_arinac dw 4
   price_sinopharm dw 2
   price_pfizer dw 4    
                                        
                                        
                                        
   
    
   amount_earned db 10,13,'Amount earned= $'                                       ;message shown in 3 option (total amount earned today)
   amount db 0                                                                     ;store 0 in variable which is use for total earning
   amount_print db 10,13,'Press 3 to show amount earned today$'
   
                                              
                                              
                                              
             
                
   panadol_print db 10,13, 'Panadols sold = $'                                     ;variable for statistics of medicine
   pfizer_print db 10,13, 'Pfizer Vaccine sold = $'                                ;will show messages 
   sinopharm_print db 10,13, 'Sinopharm Vaccine sold = $'                          ;show how many  medicine sell
   arinac_print db 10,13, 'Arinac sold = $'
   surbex_print db 10,13, 'Surbex sold = $'
   aspirin_print db 10,13, 'Aspirin sold = $'
   brufen_print db 10,13, 'Brufen sold = $'
   cleritek_print db 10,13, 'Cleritek sold = $'
   paracetamol_print db 10,13, 'Paracetamol sold = $'  
   
                                                
                                                
   
   
   panadol_sold db 0
   paracetamol_sold db 0
   cleritek_sold db 0                                                              ;variable for statistics of medicine
   aspirin_sold db 0                                                               ;will show how many  medicine sell
   brufen_sold db 0                                                                ;will show for each medicine
   surbex_sold db 0
   arinac_sold db 0
   sinopharm_sold db 0
   pfizer_sold db 0
    
                                               
                                               
            
.code                                                                              ;code section starts
                                               
                                               
                                               
main proc
        
        
    mov ax,@data                                                                   ;accessing data section
    mov ds,ax                                                                      ;mov ax to dx... To access fast( heap initialization )
     
    
    pass:                                                                          ;lable for password
    mov dx,offset input_password                                                   ;print that / load in dx register
    mov ah,9                                                                       ;for output the string
    int 21h                                                                        ;intrepet
    
    mov dx,offset newLine                                                          ;new line
    mov ah,9
    int 21h 
    
    mov bx,offset password                                                         ;print that / load in dx register  
    
    
    mov cx,5                                                                       ; initializing counter register for 5
    l1:
    mov ah,1
    int 21h
    cmp al,[bx]                                                                    ;taking password from user 
    jne incorrect                                                                  ;camparing each element
    inc bx                                                                         ;if password doesnot match so jump to incorrect lable will show mesage in that
    loop l1                                                                        ;lable and then will take input again..... 
          
          
    start:
    mov dx,offset newLine
    mov ah,9
    int 21h
    call menu                                                                      ; call the menu function to display main menu

    mov dx,offset newLine
    mov ah,9
    int 21h    
    
    mov ah,1                                                                       ;after showing the manu  
    int 21h                                                                        ;take input / choice from user 
                                                                                   ;in which menu admin wnat to go
    cmp al,'1'
    je menu2  
    cmp al,'2'                                                                     ;campre user input
    je medicines_stats
    cmp al,'3'
    je show_amount
    cmp al,'4'
    je exit
    
    mov dx,offset wrong_input                                                     ;print that / load in dx register
    mov ah,9                                                                      ;if user enter a key which is wrong so it will display an error message
    int 21h
    mov dx,offset input_again                                                     ;print line that please input again then jump to main menu and 
    mov ah,9                                                                      ;take the user choice again
    int 21h    
    jmp start                                                                      
     
     
          
          
     
     
    panadol:                                                                      ;lable for medicine ( panadol)
         
        mov dx,offset msg_panadol                                                 ;message that asking user to enter quantity
        mov ah,9                                                                  ;output the string
        int 21h                                                                   ;intrept
            
        mov dx,offset newLine
        mov ah,9                                                                  ;move to new line
        int 21h        
        
        mov ah,1                                                                  ;take user input
        int 21h
        
        cmp al,'9'                                                                ;if user enter wrong input show error message
        jg wrong                                                                  
        
        sub al,48                                                                 ;subtract the acssi of 0 from input
        
        add panadol_sold,al                                                       ;add that quantity in sold , to recronized total sold 
        mul price_panadol
        
        add amount,al                                                             ;add that earned amount in total earning
        mov cl,al
        mov dx,offset newLine
        mov ah,9
        int 21h
        mov dx,offset total_msg
        mov ah,9                                                                  ;show the totol of last sell
        int 21h                                                                   ;move the value of cl to dl 
        mov dl,cl                                                                 ;add 48 ( ascci of 0)
        add dl,48                                                                 ;output 
        mov ah,2
        int 21h
        
         
                
        jmp start                                                                 ; jump to main menu
     
     
     
     
          
                     
                     
    paracetamol:                                                                  ;lable for medicine ( paacetamol)
    
        mov dx,offset msg_paracetamol                                             
        mov ah,9                                                                  
        int 21h                                                                  
            
        mov dx,offset newLine                                                     
        mov ah,9
        int 21h                                                                   ;same work as done in the previous lable
                                                                                  ;all functionality of this lable is same
        
        mov ah,1                                                                  
        int 21h
        
        cmp al,'9'
        jg wrong
                                                                                  
        sub al,48
        
        add paracetamol_sold,al                                                   
        mul price_paracetamol                                                     
        
        add amount,al
        mov cl,al                                                                 
        mov dx,offset newLine
        mov ah,9
        int 21h
        mov dx,offset total_msg
        mov ah,9                                                                  
        int 21h                                                                   
        mov dl,cl                                                                 
        add dl,48                                                                 
        mov ah,2
        int 21h
        
        jmp start
        
     
     
        
                              
    
    cleritek:                                                                      ;lable for medicine ( cleritek )
        
        mov dx,offset msg_cleritek                                                
        mov ah,9                                                                  
        int 21h                                                                   
            
        mov dx,offset newLine
        mov ah,9
        int 21h        
        
        mov ah,1                                                                  
        int 21h    
                                                                                      ;same work as done in the previous lable
        cmp al,'9'                                                                    
        jg wrong                                                                       ;all functionality of this lable is same
        
        sub al,48                                                                 
        
        add cleritek_sold,al                                                      
        mul price_cleritek
        
        add amount,al
        mov cl,al
        mov dx,offset newLine
        mov ah,9
        int 21h
        mov dx,offset total_msg
        mov ah,9                                                                  
        int 21h                                                                   
        mov dl,cl                                                                 
        add dl,48                                                                 
        mov ah,2
        int 21h
        
        jmp start
        
    
    
          
          
    aspirin:
         
        mov dx,offset msg_aspirin
        mov ah,9
        int 21h
            
        mov dx,offset newLine
        mov ah,9
        int 21h                                                                   ;same work as done in the previous lable
                                                                                   ;all functionality of this lable is same
        mov ah,1                                                                  
        int 21h
        
        cmp al,'9'
        jg wrong
        sub al,48
        
        add aspirin_sold,al
        mul price_aspirin
        
        add amount,al
        mov cl,al
        mov dx,offset newLine
        mov ah,9
        int 21h
        mov dx,offset total_msg
        mov ah,9                                                                 
        int 21h                                                                   
        mov dl,cl                                                                 
        add dl,48                                                                 
        mov ah,2
        int 21h
        
         
                
        jmp start
           
    
    
           
           
    
    brufen:
         
        mov dx,offset msg_brufen
        mov ah,9
        int 21h
            
        mov dx,offset newLine
        mov ah,9
        int 21h        
                                                                                  ;same work as done in the previous lable
                                                                                  ;all functionality of this lable is same
        mov ah,1
        int 21h
        
        cmp al,'9'
        jg wrong
        
        sub al,48
        
        add brufen_sold,al
        mul price_brufen
        
        add amount,al
        mov cl,al
        mov dx,offset newLine
        mov ah,9
        int 21h
        mov dx,offset total_msg
        mov ah,9                                                                  
        int 21h                                                                    
        mov dl,cl                                                                 
        add dl,48                                                                 
        mov ah,2
        int 21h
        
         
                
        jmp start
        
    
          
          
    
    
    surbex:
         
        mov dx,offset msg_surbex
        mov ah,9
        int 21h
            
        mov dx,offset newLine
        mov ah,9
        int 21h                                                                   ;same work as done in the previous lable
                                                                                  ;all functionality of this lable is same
        
        mov ah,1
        int 21h
        
        cmp al,'9'
        jg wrong
        
        sub al,48
        
        add surbex_sold,al
        mul price_surbex
        
        add amount,al
        mov cl,al
        mov dx,offset newLine
        mov ah,9
        int 21h
        mov dx,offset total_msg
        mov ah,9                                                                  
        int 21h                                                                   
        mov dl,cl                                                                 
        add dl,48                                                                 
        mov ah,2
        int 21h
        
         
                
        jmp start
     
           
           
    
    
    
    arinac:
         
        mov dx,offset msg_arinac
        mov ah,9
        int 21h
            
        mov dx,offset newLine
        mov ah,9
        int 21h        
                                                                                  ;same work as done in the previous lable
                                                                                  ;all functionality of this lable is same
        mov ah,1
        int 21h
        
        cmp al,'9'
        jg wrong
        
        sub al,48
        
        add arinac_sold,al
        mul price_arinac
        
        add amount,al
        mov cl,al
        mov dx,offset newLine
        mov ah,9
        int 21h
        mov dx,offset total_msg
        mov ah,9                                                                  
        int 21h                                                                    
        mov dl,cl                                                                 
        add dl,48                                                                 
        mov ah,2
        int 21h
                
        jmp start
        
    
    
           
           
    
    
    sinopharm:
         
        mov dx,offset msg_sinopharm
        mov ah,9
        int 21h
            
        mov dx,offset newLine
        mov ah,9
        int 21h                                                                   ;same work as done in the previous lable
                                                                                  ;all functionality of this lable is same
        
        mov ah,1
        int 21h
        
        cmp al,'9'
        jg wrong
        
        sub al,48
        
        add sinopharm_sold,al
        mul price_sinopharm
        
        add amount,al
        mov cl,al
        mov dx,offset newLine
        mov ah,9
        int 21h
        mov dx,offset total_msg
        mov ah,9                                                                  
        int 21h                                                                    
        mov dl,cl                                                                 
        add dl,48                                                                 
        mov ah,2
        int 21h
                
        jmp start
     
    
    
    
    
          
          
    pfizer:
         
        mov dx,offset msg_pfizer
        mov ah,9
        int 21h
            
        mov dx,offset newLine
        mov ah,9
        int 21h        
                                                                                  ;same work as done in the previous lable
                                                                                  ;all functionality of this lable is same
        mov ah,1
        int 21h
        
        cmp al,'9'
        jg wrong
        
        sub al,48
        
        add pfizer_sold,al
        mul price_pfizer
        
        add amount,al
        mov cl,al
        mov dx,offset newLine
        mov ah,9
        int 21h
        mov dx,offset total_msg
        mov ah,9                                                                  
        int 21h                                                                    
        mov dl,cl                                                                 
        add dl,48                                                                
        mov ah,2
        int 21h
                
        jmp start
     
            
            
    
    
    show_amount: 
                                                                               ;lable that show the total amount earned 
        mov dx,offset amount_earned
        mov ah,9                                                               ;print that / load in dx register
        int 21h                                                                ;output the string
         
        
        mov dl,amount
        add dl,48                                                              ;move the value of variable into dl register
        mov ah,2                                                               ;add ascci of 0
        int 21h
        
        jmp start   
        
   
             
             
   
   incorrect:                                                                   ;if password was incorrect so program will jump here
        
        mov dx,offset incorrect_password                                        ;print that / load in dx register
        mov ah,9                                                                ;output string
        int 21h                                                                 ;intrept
        jmp pass                                                                ;jump to start and take password again
        
   
   
   wrong:
           mov dx,offset wrong_input                                            ;print that / load in dx register
           mov ah,9                                                             ;if user enter a key which is wrong so it will display an error message
           int 21h
           mov dx,offset input_again                                            ;print line that please input again then jump to main menu and 
           mov ah,9                                                             ;take the user choice again
           int 21h   
           jmp menu2
           
           
                                                                                ;lable to exit the program
   exit:
        mov ah,4ch
        int 21h
            
main endp                                                                      ; ending the main function
    
   
   
        
        
   
    menu proc
              
        ;mov ah,00
        ;mov al,2
        ;int 10h
              
        mov dx,offset welcome1
        mov ah,9
        int 21h
        
        mov dx,offset welcome2
        mov ah,9
        int 21h
        
        mov dx,offset welcome3
        mov ah,9
        int 21h
        
        mov dx,offset welcome4
        mov ah,9
        int 21h                                                            ; show the wellcome messsage
        
        mov dx,offset welcome5
        mov ah,9
        int 21h
        
        mov dx,offset welcome6
        mov ah,9
        int 21h
        
        mov dx,offset welcome7
        mov ah,9
        int 21h
        
                                                                    
        
        mov dx,offset msg1
        mov ah,9
        int 21h
                                                                            ; will show the front or main menu meaages
        mov dx,offset msg_medicines
        mov ah,9
        int 21h
        
        mov dx,offset medicines_sold
        mov ah,9
        int 21h
        
        mov dx,offset amount_print
        mov ah,9
        int 21h
        
        mov dx,offset exit_program
        mov ah,9
        int 21h                   
        
             
        ret                                                               ;end of that function
          
    menu endp
    
   
          
          
   
   
                                                                      
    menu2 proc                                                      ;function that is user for medicines  
                                                                      
        pick:      
        mov dx,offset msg2                                          
        mov ah,9
        int 21h
        
        mov dx,offset opt1
        mov ah,9
        int 21h                                                    ;showing messages / types of medicine avalable in the store 
                                                                   
        mov dx,offset opt2
        mov ah,9                                                   ;asking user that want medicine he/she want to but
        int 21h
            
        mov dx,offset opt3
        mov ah,9
        int 21h
        
        mov dx,offset opt4
        mov ah,9
        int 21h
        
        mov dx,offset opt5
        mov ah,9
        int 21h
            
        mov dx,offset opt6
        mov ah,9         
        int 21h
        
        mov dx,offset opt7
        mov ah,9
        int 21h
        
        mov dx,offset opt8
        mov ah,9
        int 21h
            
        mov dx,offset opt9
        mov ah,9
        int 21h
        
        mov dx,offset newLine
        mov ah,9
        int 21h    
                                                                     
        mov ah,1                                                     ;taking input from user ( choice of user)
        int 21h                                                      ;intrept
        
           
           
           
        cmp al,'1'
        je panadol                                                   ;camparing user input
        cmp al,'2'                                                  
        je paracetamol
        cmp al,'3'                                                   ;will jump to lable according to user direction
        je cleritek
        cmp al,'4'
        je aspirin
        cmp al,'5'
        je brufen  
        cmp al,'6'
        je surbex
        cmp al,'7'
        je arinac
        cmp al,'8'
        je sinopharm
        cmp al,'9'
        je pfizer  
        
         
        
        mov dx,offset wrong_input                                    ; if user enter a wrong choice then show an error message
        mov ah,9                                                     
        int 21h                                                      ; then ask user to enter choice again
        mov dx,offset input_again
        mov ah,9
        int 21h                                                      ;intrept 
        jmp pick                                                     ;jump to that menu again
     
        
        ret                                                          ;instruction for return
            
            
    menu2 endp                                                       ;end the menu2
     
   
   
   
          
          
   
    medicines_stats proc
          
          
        mov dx,offset panadol_print
        mov ah,9
        int 21h
  
        mov dl,panadol_sold
        add dl,48
        mov ah,2                                                          ;function that is used in medicine statistics
        int 21h
        
        
                                                                          
        mov dx,offset paracetamol_print
        mov ah,9
        int 21h

        mov dl,paracetamol_sold
        add dl,48
        mov ah,2                                                          ; will the message for each medicine and 
        int 21h                                                           ; show quantity of medicine sold
        
        
        
        
        mov dx,offset cleritek_print
        mov ah,9
        int 21h 
  
        mov dl,cleritek_sold
        add dl,48
        mov ah,2
        int 21h
        
        
        
       
        mov dx,offset aspirin_print
        mov ah,9
        int 21h
          
        mov dl,aspirin_sold
        add dl,48
        mov ah,2
        int 21h
        
        
        
        
        mov dx,offset brufen_print
        mov ah,9
        int 21h
        
        mov dl,brufen_sold
        add dl,48
        mov ah,2                                                          ; will the message for each medicine and 
        int 21h                                                           ; show quantity of medicine sold
        
          
          
          
        mov dx,offset arinac_print
        mov ah,9
        int 21h
         
        mov dl,arinac_sold
        add dl,48
        mov ah,2
        int 21h
         
          
          
          
        mov dx,offset pfizer_print
        mov ah,9
        int 21h
        
        mov dl,pfizer_sold
        add dl,48
        mov ah,2
        int 21h
             
          
           
             
        mov dx,offset sinopharm_print
        mov ah,9
        int 21h
        
        mov dl,sinopharm_sold
        add dl,48
        mov ah,2
        int 21h
            
            
        jmp start
        
        ret 
          
    medicines_stats endp                                                  ; end of function
        
end main  
 
 
 ;simply explation of my project and how its work 

;Simply user will log in through a password. if the user enter the wrong password then 
;it will display and error message and will ask the user to enter the password again.
;Then further on user will have 4 option either he / she want to buy medicine or want
; to view the record of medicine, user can also view total earning 

;1.	If the user select first option then in medicine user can select any of available
; medicine and can also select the quantity of medicine. if the user any wrong entry 
;then an error message will display and will ask the user to enter an valid entry 


;2.	If user select the second option then in if then record of the medicine will be 
;displayed, this record will contain a record of all the medicine sold out. this 
;section of my project is named as medicines statistics


;3.	If the user selects the third option then in this all earnings of
; that day will be displayed.

;4.	If User selects the forth option then it will simply exit the program.

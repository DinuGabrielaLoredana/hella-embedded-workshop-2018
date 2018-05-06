/* ========================================================================== */
/*                                                                            */
/*   DigitalInputs.c                                                               */
/*   (c) 2015 Micu&Georgiana                                                          */
/*                                                                            */
/*  Verificare Intrari digitale                                                             */
/*                                                                            */
/* ========================================================================== */


#include <stdio.h>
#include <stdlib.h>

#include <p18f8722.h>
#include <spi.h>
#include <delays.h>
#include "LCD.h"
#include "DigitalInputs.h"


// configuration bits
#pragma config OSC = HS         // Oscillator Selection bits (HS oscillator)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
#pragma config WDT = OFF        // Watchdog Timer (WDT disabled (control is placed on the SWDTEN bit))
#pragma config LVP = OFF

/* TODO: Write your port here */
#define LEFTBUTTON PORTBbits.RB0
#define RIGHTBUTTON PORTAbits.RA4 
/* END OF TODO: Write your port here */



/*******************************************************************************
 * Init Buttons Function
 */
void initButtons(void)
{
    /* RB0 butonul stang */
    TRISB0 = 1; /* configurare RB0 ca input */
    
    /* RA4 butonul drept */
    TRISA4 = 1; /* configurare RA4 ca input */

} /* void initButtons(void) */





/*******************************************************************************
   
 * sequence1 -  Functie pentru afisarea starii unui buton (Pressed sau Not pressed)
 */
void sequence1(void)
{
    char leftButton = LEFTBUTTON;

    /*Verificare daca butonul stang a fost apasat*/

    if (1 == leftButton)
    {
        LcdGoTo(0);

        /*Afisare pe ecran starea butonului - Pressed*/

        LcdWriteString("Not Pressed        ");

    }
    else
    {
        LcdGoTo(0);

        /*Afisare pe ecran starea butonului - Not pressed*/

        LcdWriteString("Pressed    ");

    }

} /* void sequence1(void) */



void sequence2(void)
{/*
    char leftButton = LEFTBUTTON;
    static int buttonTimesPressed = 0;
    char message_P[32]="Pressed    ";
    if (0 == leftButton){
        buttonTimesPressed++;//somehow to convert to int to string
        sprintf(message_P + 8,"%d times", buttonTimesPressed);
        LcdGoTo(0);
        LcdWriteString(message_P);
       
        // mai voiau sa aprindem si led pentru a repr numarul de click-uri 
        //i++ ul se mareste si daca tii butonul apasat, 
        //alta cerinta era sa se contorizeze 3 click-uri si sa se intample ceva
    } else
    {
        LcdGoTo(0);
    
        /*Afisare pe ecran starea butonului - Not pressed*/

        
    
    }
    
    /* TODO: 
  *Afisarea numarului de apasari pentru butonul drept RA4
  * END OF TODO */

/* void sequence2(void) */

void sequence3(void)

{   
    char leftButton = LEFTBUTTON;
    //static int buttonTimesPressed = 0;
    static int temporaryCounter = 0;
    static char lastState = 0;
    
    char message_P[32]="Pressed    ";
    
    if (0 == leftButton
        && lastState =! leftButton){
        
            lastState = leftButton;
            temporaryCounter++;
            _delay(10000);
            if(temporaryCounter == 5){
                LcdGoTo(0);
                LcdWriteString(message_P);
            }
            
        }else{
            temporaryCounter = 0;
        }  
        // mai voiau sa aprindem si led pentru a repr numarul de click-uri 
        //i++ ul se mareste si daca tii butonul apasat, 
        //alta cerinta era sa se contorizeze 3 click-uri si sa se intample ceva
     
 
        

        /*Afisare pe ecran starea butonului - Not pressed*/

    // daca butonul se apasa o perioada de timp , atunci s-a inregistrat actiunea
  /* TODO: 
  *Implementarea SW Debounce pentru butonul stang RB0
  * END OF TODO */

}
 
/* void sequence3(void) */



/*
 * "sequence"  - Variabila masinii de stari care va fi initializata cu numarul exercitiului pe care doriti sa il rulati
 *  Ex: Daca doriti sa rulati seqeunce1(), initializati variabila "sequence" cu 1. s.a.m.d
 */

int sequence = 3;
 
void main()
{
 /* Functie pentru setarea butoanelor ca pini de intrare  */

  initButtons();

  /*initializarea LCD-ului - functia este apelata de 3 ori pentru stabilizare*/

  LcdInit();
  LcdInit();
  LcdInit();

  while(1)
  {
      switch(sequence)
      {
          case 1:
          {
              /*Executarea primei secvente de citire a starii butonului RB0- pressed/not pressed*/
              sequence1();
              break;
          }
          case 2:
          {
              /*Executarea secventei a 2-a care contorizeaza numarul de apasari ale butonului RA4*/
              sequence2();
              break;
          }

          case 3:
          {
              /*Executarea secventei a 3-a SW Debounce pe butonul RB0*/
              sequence3();
              break;
          }

          default:
          {
              break;
          }
      }
    
  }
  
  
}

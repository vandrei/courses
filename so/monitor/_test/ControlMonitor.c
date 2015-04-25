#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int NrE,NrS,NrW,NrX;

int NrCond;
int *Cond = NULL;

void IncEnter()
{
	NrE++;
        printf("Thread %d: IncEnter()\n", (int)pthread_self());

}
void DecEnter()
{
	NrE--;
        printf("Thread %d: DecEnter()\n", (int)pthread_self());

}
void IncSignal()
{
	NrS++;
        printf("Thread %d: IncSignal()\n", (int)pthread_self());

}
void DecSignal()
{
	NrS--;
        printf("Thread %d: DecSignal()\n", (int)pthread_self());

}
void IncWait()
{
	NrW++;
        printf("Thread %d: IncWait()\n", (int)pthread_self());

}
void DecWait()
{
	NrW--;
        printf("Thread %d: DecWait()\n", (int)pthread_self());

}

void IncNrX()
{
	NrX++;

}
void DecNrX()
{
	NrX--;

}
int GetNrX()
{
	return NrX;
}
void ResetNrX()
{
	NrX=0;
}

void SetNrCond(int nrCond)
{
	NrCond=nrCond;
	Cond=(int*)malloc(nrCond*sizeof(int));
	memset(Cond,0,nrCond*sizeof(int));
}
void FreeNrCond(int nrCond)
{
	free(Cond);
    Cond = NULL;
}
void VerificaConditia(int nrCond)
{
	if(nrCond>=NrCond)
	{
		printf("Ai declarat ca ai %d conditii; deci nu poti zice ca incrementezi/decrementezi conditia %d\n",NrCond,nrCond);
		exit(1);
	}
	if(nrCond<0)
	{
		printf("Nu se paote ca o conditie sa fie negativa; a ta este: %d\n",nrCond);
		exit(1);
	}	
}

void IncCond(int nrCond)
{
        printf("Thread %d: IncCond(%d)\n", (int)pthread_self(), nrCond);
	VerificaConditia(nrCond);
	Cond[nrCond]++;
}
void DecCond(int nrCond)
{
        printf("Thread %d: DecCond(%d)\n", (int)pthread_self(), nrCond);
	VerificaConditia(nrCond);
	Cond[nrCond]--;
}

// Folosita pt. verificarea starii monitorului, cand avem <= 2 variabile de conditie
int Verifica(int e,int s,int w,int x,int q00,int q11)
{
//	printf("%d %d %d %d %d %d \n",e,s,w,x,q00,q11);
//	printf("%d %d %d %d %d %d \n",NrE,NrS,NrW,NrX, NrCond >=1 ? Cond[0] : -1, NrCond >= 2 ? Cond[1] : -1);
	if(e!=NrE || s!=NrS  || w!=NrW || x!=NrX)
	{
            printf("E/S/W/X: expected: %d/%d/%d/%d - received: %d/%d/%d/%d\n",
                   e, s, w, x, NrE, NrS, NrW, NrX);
		return -1;
	}
	if(NrCond>=1)
	{
		if(Cond[0]!=q00)
		{
                    printf("Cond0 expected: %d - received: %d\n", q00, Cond[0]);
		    return -1;
		}
	}
	if(NrCond>=2)
	{
		if(Cond[0]!=q00  || Cond[1]!=q11)
		{
                        printf("Cond0/1 expected: %d/%d - received: %d/%d\n", q00, q11, Cond[0], Cond[1]);
			return -1;
		}
	}

	return 0;
}

// Folosita pt. verificarea starii monitorului, cand avem oricate variabile de conditie
int VerificaMult(int e, int s, int w, int x, int *q)
{
    int i, result = 0;

    if (q == NULL)
    {
        printf("q este NULL\n");
        return -1;
    }

    if (e != NrE || s != NrS || w != NrW || x != NrX)
    {
        //printf("e = %d, s = %d, w = %d, x = %d\n", e, s, w, x);
        //printf("NrE = %d, NrS = %d, NrW = %d, NrX = %d\n", NrE, NrS, NrW, NrX);
        return -1;
    }

    for (i = 0; i < NrCond; i++)
        if (Cond[i] != q[i]) 
        {
            result = -1;
            printf("i = %d, Cond = %d, q = %d\n", i, Cond[i], q[i]);
        }

    return result;
}

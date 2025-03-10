/*\
 exememo.c

 Specific routines for operating system memory allocation

 Jan 1998

 Van Mo DANG
 Universite de Technologie de Compiegne
 URA CNRS 817

 Vers-mod  Date         Description

 1.05-a    26-JAN-1998  Creation
 \*/


#include <stdlib.h>  /* calloc, free, size_t */
#include <stdio.h>   /* stderr */
#include <R.h>

/* ------------------------------------------------------------------- */
void* GenAlloc
(
        size_t       nelem,
        size_t       elsize,
        int          doexit,
        const char*  where,
        const char*  what
)
{
    void *result = calloc(nelem, elsize);
    if (result != NULL)
    {
        return result;
    }
    char msg[256];
    snprintf(msg, sizeof(msg),
             "Fatal: in %s, no memory for %s (%zu elements size %zu)\n",
             where, what, nelem, elsize);
    if (doexit)
    {
        fprintf(stderr, "%s", msg);
        exit(EXIT_FAILURE);
    }
    return NULL;
}
/* ------------------------------------------------------------------- */

/* ------------------------------------------------------------------- */
void GenFree( void* ptr )
{
    if ( ptr != NULL )
        free( ptr ) ;
}
/* ------------------------------------------------------------------- */

#include <iostream>

#ifdef EMSCRIPTEN
#include <emscripten.h>
#endif

extern "C"
{

int MeaningOfLife ()
{
	return 42;
}

}

int main (int, char**)
{
	return 0;
}

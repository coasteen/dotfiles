//Modify this file to change what commands output to your statusbar, and recompile using the make command.
#ifdef __linux__
	#define SIG 10
#elif __OpenBSD__
	#define SIG 1
#elif __FreeBSD__
	#define SIG 1
#endif

static const Block blocks[] = {
//	  Label		   Command				Int		SIG
    //{"IP: ",	"sb-network",			1,		0},
    {"CPU: ",	"sb-cpuusage",			1,		0},
	{"TMP: ",	"sb-cputemp",		1,		0},
	{"VOL: ",	"sb-volume",			1,		SIG},
	{"MEM: ",	"sb-memory",			1,		0},
	{"BAT: ",	"sb-battery",			60,		0},
	{"",		"date '+%H:%M'",	1,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;


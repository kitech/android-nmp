
#ifndef _NAMESER_H_
#define _NAMESER_H_

#define dn_skipname __dn_skipname
#define res_ninit __res_ninit
#define res_nsearch __res_nsearch
#define res_nclose __res_nclose

/*
 * Global defines and variables for resolver stub.
 */
#define	MAXNS			3	/* max # name servers we'll track */
#define	MAXDFLSRCH		3	/* # default domain levels to try */
#define	MAXDNSRCH		6	/* max # domains in search path */
#define	LOCALDOMAINPARTS	2	/* min levels in name that is "local" */

#define	RES_TIMEOUT		5	/* min. seconds between retries */
#define	MAXRESOLVSORT		10	/* number of net to sort on */
#define	RES_MAXNDOTS		15	/* should reflect bit field size */
#define	RES_MAXRETRANS		30	/* only for resolv.conf/RES_OPTIONS */
#define	RES_MAXRETRY		5	/* only for resolv.conf/RES_OPTIONS */
#define	RES_DFLRETRY		2	/* Default #/tries. */
#define	RES_MAXTIME		65535	/* Infinity, in milliseconds. */

struct __res_state {
	int	retrans;	 	/* retransmition time interval */
	int	retry;			/* number of times to transmit (attempts, not retries) */
#ifdef sun
	u_int	options;		/* option flags - see below. */
#else
	u_long	options;		/* option flags - see below. */
#endif
	int	nscount;		/* number of name servers */
	struct sockaddr_in
		nsaddr_list[MAXNS];	/* address of name server */
#define	nsaddr	nsaddr_list[0]		/* for backward compatibility */
	u_short	id;			/* current message id */
	char	*dnsrch[MAXDNSRCH+1];	/* components of domain to search */
	char	defdname[256];		/* default domain (deprecated) */
#ifdef sun
	u_int	pfcode;			/* RES_PRF_ flags - see below. */
#else
	u_long	pfcode;			/* RES_PRF_ flags - see below. */
#endif
	unsigned ndots:4;		/* threshold for initial abs. query */
	unsigned nsort:4;		/* number of elements in sort_list[] */
	char	unused[3];
	struct {
		struct in_addr	addr;
		u_int32_t	mask;
	} sort_list[MAXRESOLVSORT];
//	res_send_qhook qhook;		/* query hook */
//	res_send_rhook rhook;		/* response hook */
	int	res_h_errno;		/* last one set for this context */
	int	_vcsock;		/* PRIVATE: for res_send VC i/o */
	u_int	_flags;			/* PRIVATE: see below */
	u_int	_pad;			/* make _u 64 bit aligned */
	union {
		/* On an 32-bit arch this means 512b total. */
		char	pad[72 - 4*sizeof (int) - 2*sizeof (void *)];
		struct {
			u_int16_t		nscount;
			u_int16_t		nstimes[MAXNS];	/* ms. */
			int			nssocks[MAXNS];
			struct __res_state_ext *ext;	/* extention for IPv6 */
		} _ext;
	} _u;
};



#define NS_INT16SZ 2
#define NS_INT32SZ 4

/*%
 * Inline versions of get/put short/long.  Pointer is advanced.
 */
#define NS_GET16(s, cp) do { \
	register const u_char *t_cp = (const u_char *)(cp); \
	(s) = ((u_int16_t)t_cp[0] << 8) \
	    | ((u_int16_t)t_cp[1]) \
	    ; \
	(cp) += NS_INT16SZ; \
} while (0)

#define NS_GET32(l, cp) do { \
	register const u_char *t_cp = (const u_char *)(cp); \
	(l) = ((u_int32_t)t_cp[0] << 24) \
	    | ((u_int32_t)t_cp[1] << 16) \
	    | ((u_int32_t)t_cp[2] << 8) \
	    | ((u_int32_t)t_cp[3]) \
	    ; \
	(cp) += NS_INT32SZ; \
} while (0)

#define	GETSHORT		NS_GET16
#define	GETLONG			NS_GET32


#endif /* _NAMESER_H_ */

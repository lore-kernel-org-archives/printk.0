Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795129440;
	b=XQrT6+AaXtLFccksmh7dpylEBKMYYrgOzw/UriSOVrZV1OAdeDG9QWb45pV6tCRX2l6m
	 Cz7j9vjhCiQNHA1mZ9miCZ9snTql7p/VPVWuPULc8p6ClliWbEBzx7YkHmUqChi+A0wm5
	 KEOQoYJfD2UVcYbxUSKdf2Hm7JzJmlSovnY8UiQUU81Xd/AG0iwbj75iO/W+swbP6C4mx
	 nYhWM/x7JHbxTgAM7QjDWpRd19qO+4h2AKRVxNtpmSSpxpYEKiYfd+/6H1c96KnmGMrXg
	 2QA9hxZxjEkaAtdXjrZerfsS0FKeTNv5kEPGfWS+1dqUsk6S6783a784lfb6f3jr3AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129440;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bN14zBhVa6ehM2qoqvgVakYsuLN6hYwejnbYVzR1c/A=;
	b=J4hjBHWDdwFuhRtkxS3OUu6WyVdS7ktnk7WRV39B1HgI/zHwIp3zlPtMfSVop3cyaB1B
	 YV7f42IxmpsFgin5fAnWg5Fh8nqiVX57jY4+VZV16cDkcjC/BxyUh8n3m/5TGlQSSEr0r
	 t7zI3M56oxTXeiKttQjpZookofNEvga3F1/fQ9WmUjck9B4TUmfi3fYUhaRJKbxurdL5C
	 Xmy0X3pOPflX3qH48eb8a/beGVys3a5JFnXj64CE8vNAdAITsL5gMqwWYv1iTIPDAH+xe
	 fmgD4U0Q7OJt8Ybt5WedYYb4aRMN9bvQLd9AurXqZbSBuW+/d/ZHCmegJJawDUIbb0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HTvovdIg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256CE606A330
	for <printk@lists.linux.dev>; Thu, 19 Nov 2026 23:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HTvovdIg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4AE1F000C4;
	Thu, 19 Nov 2026 23:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795129439;
	bh=bN14zBhVa6ehM2qoqvgVakYsuLN6hYwejnbYVzR1c/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HTvovdIgeZG09l5qIayYNdav8+t7sy6uO4lcU7QFH3xO8d3wRK3cvjvGrNXbJ5y5F
	 dneu/gQOL9jdOlbVdsxfInPNalgaVPlHzf880gIL7v4JDwMba5KEyV3mAm4NZG5F56
	 x3AzWUzrrbXH0awSMDqTajduy82cmM8oVCROO/yiu1CAMyQ/jXGQzmk5DJjSwxoWRv
	 9IKqY5BOUZILGdORShhFF4Y3mo7XdCy2Egk1Op+Cf6kO3N7RDlJ9AqrDGFULPOEO8Z
	 1b/4es3SAxwvxjGbprhlig9sVzycTop75LECYgwgLqEB5SYkl5D8+hqg1ry6yOA+8h
	 wGji4vccknGJw==
Message-ID: <sashiko-outbox-224169@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH printk v3 6/7] printk: Add unsafe flush points for
 panic+kexec and emergency_restart
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Ogness" <john.ogness@linutronix.de>, "Petr Mladek" <pmladek@suse.com>
Cc: "Sergey Senozhatsky" <senozhatsky@chromium.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Breno Leitao" <leitao@debian.org>, printk@lists.linux.dev, "Andrew
 Morton" <akpm@linux-foundation.org>, "Baoquan He" <baoquan.he@linux.dev>, "Mike
 Rapoport" <rppt@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Dave Young" <ruirui.yang@linux.dev>, "Bradley
 Morgan" <include@grrlz.net>, "Oleg Nesterov" <oleg@redhat.com>, "Pavel
 Tikhomirov" <ptikhomirov@virtuozzo.com>, "Petr Pavlu" <petr.pavlu@suse.com>,
 =?utf-8?b?Q2VuIFpoYW5nIChNaWNyb3NvZnQp?= <blbllhy@gmail.com>, kexec@lists.infradead.org
In-Reply-To: <20261118230345.808560-7-john.ogness@linutronix.de>
References: <20261118230345.808560-1-john.ogness@linutronix.de>
 <20261118230345.808560-7-john.ogness@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 23:03:58 +0000
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] printk: nbcon: con->pbufs corruption on hostile takeover in
  emergency_restart()
--

commit bc98e7fe84227c1b12eaff8bf1021023be510742
Author: John Ogness <john.ogness@linutronix.de>

printk: Add unsafe flush points for panic+kexec and emergency_restart

This commit adds nbcon_atomic_flush_unsafe(PR_FLUSH_RESTART) calls to
__crash_kexec() and emergency_restart() so that CON_NBCON_ATOMIC_UNSAFE
consoles can flush when permitted by their unsafe policy.

> diff --git a/kernel/reboot.c b/kernel/reboot.c
> index a93c23b9e1948..b26d131c54151 100644
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -102,6 +102,7 @@ void emergency_restart(void)
>  	 */
>  	nbcon_cpu_emergency_enter();
>  	printk_trigger_flush();
> +	nbcon_atomic_flush_unsafe(PR_FLUSH_RESTART);
> =20
>  	machine_emergency_restart();
>  }

[Severity: Medium]
Can this corrupt con->pbufs when emergency_restart() performs a hostile
takeover outside of panic()?

When emergency_restart() is invoked directly (for example via SysRq-b)
rather than from panic(), panic_on_this_cpu() is false and other CPUs remain
active.  If a console permits unsafe takeover on PR_FLUSH_RESTART (such as
netconsole with NBCON_EMERGENCY_RESTART_FLUSH) while an NBCON_PRIO_NORMAL
context holds it inside an unsafe section, nbcon_context_try_acquire()
performs an unsafe hostile takeover at NBCON_PRIO_EMERGENCY but still
assigns con->pbufs instead of panic_nbcon_pbufs:

kernel/printk/nbcon.c:nbcon_context_try_acquire() {
	...
	/* Assign the appropriate buffer for this context. */
	if (panic_on_this_cpu())
		ctxt->pbufs =3D &panic_nbcon_pbufs;
	else
		ctxt->pbufs =3D con->pbufs;
	...
}

CPU0 (NBCON_PRIO_NORMAL)          CPU1 (emergency_restart)
nbcon_emit_next_record()
  nbcon_context_enter_unsafe()
  printk_get_next_message()
    // writes con->pbufs->outbuf
                                  nbcon_atomic_flush_unsafe(PR_FLUSH_RESTAR=
T)
                                    ...
                                    nbcon_context_try_acquire_hostile()
                                    ctxt->pbufs =3D con->pbufs
                                    nbcon_emit_next_record()
                                      printk_get_next_message()
                                        // overwrites con->pbufs->outbuf
  con->write_thread()
    // reads corrupted con->pbufs->outbuf  <-- buffer corruption

Both contexts then concurrently read and write con->pbufs->outbuf and
con->pbufs->scratchbuf.  For netconsole_ext, overwriting the formatted
message while send_msg_fragmented() is scanning wctxt->outbuf for the ';'
header delimiter can trigger WARN_ON_ONCE(!msgbody) or match a ';' past
MAX_PRINT_CHUNK, overflowing nt->buf[].

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118230345.8085=
60-1-john.ogness@linutronix.de?part=3D6

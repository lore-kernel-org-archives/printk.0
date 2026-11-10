Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313906;
	b=bXyQzvNj6lK0FtO7oOC/rN9qHCsrIGer8sf8u5ETHBjCdt55cgsGBYwp7qnMrU35QYfu
	 7m8kqH8AESu7dneEMKRfXGGXjTjF1Qv+nQ70+DAONIhFNmN4oEvTTilmwMYlBWBGcfXyS
	 kxUWv17ejRm2djIimVCgVYfCbgz79jD8PGa6SRqaz7X0WdBh//7aMhjieGP9oj96EsJAs
	 MG8OpILJ6C6bWmkZ7wCBHZImbP81kF6GssRVjYCnZBORXI9V798EIj6zsCV9F2KF6MTX7
	 +/ap4e8/HmpVDQ9MzfhGqJM1RrtWD77x/5zcH9p44vGgz4aUrr54mY658gw2pVnzskA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313906;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dWJPBGThLFJByv2UkZ/VLruGGmqVFvQtuLEIC7nDM1E=;
	b=ZsfV/VETRL2Ktrei+6DV1WwP9oB3Fc5VaSm1/BcQOnxiEJPnukldQ17pQRi+7bXh80JP
	 O/1QdY3Nh2ZH6/JN5gJMquywJ9Z0UOebBbqzSXFdy4o3TD/ljMa64FslIQ0T93lcTFMzw
	 dyzbIr6xyyA8P4YO6WW1bU//rPK5GUqPKBKD9Zyb3Jig0TZVPCqNS1Mqp8B1qu2tuy9v7
	 VW4PoceMPEFjDMqYR6fWAqdcfa/4YdSFy7IbjFb7z47p8jL8I4XOBKmikw/zG+3M6soEG
	 vxwcl1Ydb1UILlBVGIgSEORjLHbDPNDgOQtWeIxUBIob/6JFcDAINZzHmmsP/jZ5gQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lrj9KDVo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7746B606A31C
	for <printk@lists.linux.dev>; Tue, 10 Nov 2026 12:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lrj9KDVo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CB31F008A1;
	Tue, 10 Nov 2026 12:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794313906;
	bh=dWJPBGThLFJByv2UkZ/VLruGGmqVFvQtuLEIC7nDM1E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lrj9KDVo1dcPHlCCm7mVLutD/MJMCwlTVuor3x0r5I+hlE+x6sklLHKSfevQmMrOQ
	 V5ppoCMasJpLNp2GRzDskcZOVtIvPaVnpUKI8ySPZ5wxi12RvUjWQVsci2wxhm/u++
	 l1AmtdK1mojM4mzH1ETam/QRL4wmLNGxlJ+Jts3jziRR2OzSepmDJG30OPA8uP5Bde
	 MlOtMELyInPGgwT77mrXEseWhz4Z8n8C8fXlUCOggA81gflsPehcz135+1ptYmdRBK
	 Wi7JkMjj+iBxXeWWX9hfQhJ9BMPBZ5AiHg3JbZuJi5BcMkV/u7gTLq/Z4yZavQ+XBd
	 WVWEP/9GnZcPQ==
Message-ID: <sashiko-outbox-207027@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH printk 6/6] netconsole: Always perform unsafe flushing
 on panic/kdb/restart
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Ogness" <john.ogness@linutronix.de>, "Petr Mladek" <pmladek@suse.com>
Cc: "Sergey Senozhatsky" <senozhatsky@chromium.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Breno Leitao" <leitao@debian.org>, printk@lists.linux.dev, "Gustavo
 Luiz Duarte" <gustavold@gmail.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>
In-Reply-To: <20261109123127.489676-7-john.ogness@linutronix.de>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
 <20261109123127.489676-7-john.ogness@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 12:31:45 +0000
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
- [Medium] netconsole: non-panic unsafe_flush_flags trigger WARN in
  hostile takeover
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] netconsole: unsafe lockless list traversal in
  netconsole_write() [1]
--

commit 1e2f8b2c899dd40b8577d9ff311ebf00557f27b8
Author: John Ogness <john.ogness@linutronix.de>

netconsole: Always perform unsafe flushing on panic/kdb/restart

This commit sets unsafe_flush_flags on the netconsole and netconsole_ext
consoles to allow unsafe NBCON flushing during panic, kdb, and restart.

> diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
> index 267254f046de9..6c1587958e915 100644
> --- a/drivers/net/netconsole.c
> +++ b/drivers/net/netconsole.c
> @@ -2695,6 +2695,8 @@ static void free_param_target(struct netconsole_tar=
get *nt)
>  static struct console netconsole_ext =3D {
>  	.name =3D "netcon_ext",
>  	.flags =3D CON_ENABLED | CON_EXTENDED | CON_NBCON | CON_NBCON_ATOMIC_UN=
SAFE,
> +	.unsafe_flush_flags =3D NBCON_PANIC_FLUSH | NBCON_PANIC_PRINTK | NBCON_=
KDB |
> +			      NBCON_NORMAL_NOTHREAD,
>  	.write_thread =3D netconsole_write_ext,
>  	.write_atomic =3D netconsole_write_ext,
>  	.device_lock =3D netconsole_device_lock,
> @@ -2704,6 +2706,8 @@ static struct console netconsole_ext =3D {
>  static struct console netconsole =3D {
>  	.name =3D "netcon",
>  	.flags =3D CON_ENABLED | CON_NBCON | CON_NBCON_ATOMIC_UNSAFE,
> +	.unsafe_flush_flags =3D NBCON_PANIC_FLUSH | NBCON_PANIC_PRINTK | NBCON_=
KDB |
> +			      NBCON_NORMAL_NOTHREAD,

[Severity: Medium]
Can enabling NBCON_KDB and NBCON_NORMAL_NOTHREAD trigger the WARN_ON_ONCE()
in nbcon_context_try_acquire_hostile() and fail to flush?

__nbcon_atomic_flush_pending_con() and nbcon_kdb_try_acquire() set
ctxt->allow_unsafe_takeover from nbcon_allow_unsafe_takeover(con, reason),
which returns true for PR_FLUSH_KDB, PR_FLUSH_RESTART, and post-kthread
PR_FLUSH_RUNTIME even when ctxt->prio is NBCON_PRIO_EMERGENCY or
NBCON_PRIO_NORMAL:

kernel/printk/nbcon.c:nbcon_kdb_try_acquire() {
	...
	ctxt->prio			=3D NBCON_PRIO_EMERGENCY;
	ctxt->allow_unsafe_takeover	=3D nbcon_allow_unsafe_takeover(con, PR_FLUSH_=
KDB);
}

kernel/printk/nbcon.c:nbcon_context_try_acquire_hostile() {
	...
	if (!ctxt->allow_unsafe_takeover)
		return -EPERM;

	/* Ensure caller is allowed to perform unsafe hostile takeovers. */
	if (WARN_ON_ONCE(ctxt->prio !=3D NBCON_PRIO_PANIC))
		return -EPERM;
}

If KDB or emergency_restart() interrupts the netconsole kthread while it is
inside the nbcon_enter_unsafe() section of netconsole_write(), direct and
handover acquisition fail with -EBUSY and nbcon_context_try_acquire() falls
through to nbcon_context_try_acquire_hostile(), hitting the warning and
returning -EPERM without flushing.

>  	.write_thread =3D netconsole_write_basic,
>  	.write_atomic =3D netconsole_write_basic,

[Severity: Critical]
This problem wasn't introduced by this patch, but can netconsole_write()
race with target list updates or device teardown [1] when called from
write_atomic without target_list_lock?

While write_thread holds target_list_lock via netconsole_device_lock(),
write_atomic invokes netconsole_write() locklessly.  netconsole_write()
traverses target_list with non-RCU list_for_each_entry() and dereferences
nt->np.dev in netif_running(nt->np.dev) and netcons_skb_pop():

drivers/net/netconsole.c:netconsole_write() {
	...
	list_for_each_entry(nt, &target_list, list) {
		if (nt->extended !=3D extended || nt->state !=3D STATE_ENABLED ||
		    !netif_running(nt->np.dev))
			continue;
	...
}

A concurrent target addition, removal, or device release on another CPU can
corrupt the list traversal or cause a NULL pointer dereference or
use-after-free on nt->np.dev:

CPU0                                CPU1
drop_netconsole_target()            netconsole_write()
  spin_lock_irqsave(&target_list_lock)
  list_del(&nt->list)
                                      list_for_each_entry(nt, &target_list,=
 ...)
                                        <-- follows torn pointer / LIST_POI=
SON
netcons_release_dev()
  nt->np.dev =3D NULL
                                        netif_running(nt->np.dev)
                                          <-- NULL pointer dereference

[1] https://sashiko.dev/#/bug/linux-5d4ba9e4-a230-401f-bfcf-b5d9ed4aa3b5

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109123127.4896=
76-1-john.ogness@linutronix.de?part=3D6

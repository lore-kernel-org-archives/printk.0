Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507612;
	b=YXpSBOHvmoL4FJ8GPBLgdwCP4pHwRlb8p6XROd9CjaivKlFm38H7guY9XKqf0Mfo1YsX
	 /MvTrfbxfZ8of5QLXlYyNCFHDRKbqB+VDb1hK2NbX0c+u7H2/o5xxdWLvxkciaNfI0thD
	 DKPljzvb1BPbsHyMfNkKS4QYqmWi4RoKpy3MXUKkyLH+Z6u+dfWGQoI3Ci9Jrs3vFCl/M
	 gjmtQiZBfP4y7D/JKMObcVLDNLInyaQsOMnlbZ6qHndHECbopkjpVmtFgdCAlXOhmyYQ8
	 FIpRvULOE3vJZ8JNfD3AVkdoD8dr953gQXOLClGOj1dWwThK6/bSi5LorTT1kKtPB5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507612;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P+J/38KuwNd8GMYAaGXM1MniSlfDl5LCHBw4TiAEj30=;
	b=eqSbThV9eESPlWA8MRHJSapiXCPhxZ/7BDwoOsGq/4zGV5TPZwuvTNIb+yR1Lr/is86Q
	 tnBDbOU++zF8H1twijXaaxhO0rS6unF0NIZMX2BF0IC14XqIif8SHEPHU3eByHd3eJIUt
	 1/hGDrZihJBaFwz5sD0BqCwx7a93Zus3mh1kr/DcorHqZRlLfq6n+U4/Yh32aZguN1WAZ
	 94wdh3IpamGkQcKix+SANIPo4nuOnE7aMUaDChFBtSVTKzk7JdVST+Um3SNEZPgUt/+mA
	 U839bZ/F/m3lQme/KeAZW+RJMzC+P6O78Fxm9jpNdiBoxduYwxLaTNDqSrVgNpBTyjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qn1Ea5yK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CC6606A321
	for <printk@lists.linux.dev>; Thu, 12 Nov 2026 18:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qn1Ea5yK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0C01F000C4;
	Thu, 12 Nov 2026 18:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794507612;
	bh=P+J/38KuwNd8GMYAaGXM1MniSlfDl5LCHBw4TiAEj30=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qn1Ea5yK9r3vdcEwTIa5MZgfu9Nysxo830gWUdtGaYtdtHiKP7oaPdvQKSdPk4kNp
	 nUadNIs9kyzKeA+KwW9VPBKEdaVqb47uYqojsfy6E6nLND3c+ycmtSGHDF4xFNUa5T
	 yJmfi0XB8/5FelV5tYPNoHrSVEFn9SJLVHEtyR2cHZFyspZbl2bihDt2Vx4drucia4
	 LzLL/6u+7n9fE5Cpthc+Qn+rOWVUo2yTfZUsR993vvJBtng9TCNzwBYPAVFhKlJXaf
	 TtbIGhdMSso2u6N8BF0guWeBl24t/KOUH27oa3XKVlKSuHkmAVdL/WzdKQYzNMq9IN
	 COlX9Kan6PPHg==
Message-ID: <sashiko-outbox-211697@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH printk v2 6/6] netconsole: Always perform unsafe
 flushing on panic/kdb/restart
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Ogness" <john.ogness@linutronix.de>, "Petr Mladek" <pmladek@suse.com>
Cc: "Sergey Senozhatsky" <senozhatsky@chromium.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Breno Leitao" <leitao@debian.org>, printk@lists.linux.dev, "Gustavo
 Luiz Duarte" <gustavold@gmail.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>
In-Reply-To: <20261111181942.593695-7-john.ogness@linutronix.de>
References: <20261111181942.593695-1-john.ogness@linutronix.de>
 <20261111181942.593695-7-john.ogness@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 18:20:11 +0000
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] netconsole: lockless target_list traversal in
  netconsole_write()
- [Low] netconsole: missing Fixes trailer for commit 7eab73b18630
--

commit fe1bd6625625f06f022158329127266eb9d033ce
Author: John Ogness <john.ogness@linutronix.de>

> netconsole: Always perform unsafe flushing on panic/kdb/restart
>
> As a legacy console the netconsole would perform unsafe flushing
> during panic/kdb/restart. With commit 7eab73b18630 ("netconsole:
> convert to NBCON console infrastructure") the netconsole is now an
> NBCON console, however it uses the CON_NBCON_ATOMIC_UNSAFE flag and
> this prevents unsafe flushing except for at the very end of panic().
>
> Enable unsafe flushing policies to allow the netconsole to perform
> unsafe flushing during all panic/kdb/restart variations, just as it
> did when it was a legacy console.
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

[Severity: Low]
Since this fixes a regression from the NBCON conversion, should it include:

  Fixes: 7eab73b18630 ("netconsole: convert to NBCON console infrastructure=
")

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
>  	.write_thread =3D netconsole_write_basic,
>  	.write_atomic =3D netconsole_write_basic,
>  	.device_lock =3D netconsole_device_lock,

[Severity: High]
Can enabling these unsafe flush flags cause netconsole_write() to race with
target_list modifications on another CPU?

nbcon_emit_one() only calls con->device_lock() (which acquires
target_list_lock) for the threaded path; when use_atomic is true, it invokes
con->write_atomic() without holding target_list_lock.  Previously,
CON_NBCON_ATOMIC_UNSAFE restricted write_atomic() to the end of vpanic()
after panic_other_cpus_shutdown() had already stopped other CPUs.  With
NBCON_PANIC_PRINTK, NBCON_PANIC_FLUSH, and NBCON_NORMAL_NOTHREAD set,
write_atomic() runs during early vpanic() before other CPUs are stopped, as
well as during emergency_restart() and post-printk_kthreads_shutdown()
reboot/halt while other CPUs are still active:

CPU0                                  CPU1
vpanic() / kernel_restart()
  ...
  nbcon_emit_one(..., true)
    netconsole_write()
      list_for_each_entry(nt,
          &target_list, list)
                                      drop_netconsole_target()
                                        spin_lock_irqsave(&target_list_lock)
                                        list_del(&nt->list)
                                        spin_unlock_irqrestore(...)
                                        ...
                                        netpoll_cleanup(&nt->np)
                                          np->dev =3D NULL
                                        config_item_put(&nt->item)
                                          kfree(nt)
        netif_running(nt->np.dev)  <-- NULL deref / use-after-free

Because netconsole_write() traverses target_list with non-RCU
list_for_each_entry() and dereferences nt->np.dev without target_list_lock,
a concurrent target removal or disable in drop_netconsole_target(),
enabled_store(), or netconsole_netdev_event() can cause a NULL pointer
dereference, use-after-free, or LIST_POISON dereference during panic or
reboot flushing.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111181942.5936=
95-1-john.ogness@linutronix.de?part=3D6

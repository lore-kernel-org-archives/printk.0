Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451458;
	b=ciT9Ip22oXm453bk6pb2khDnkm57PIZwvMZf9P7pXqf5U+6KuZwRdbeJESLIe93cPE/q
	 6EN1touBoSzQuAlmEVBLtwA5PRVshnZ/kSZUqFW/IGysi7rjmVXQEQz37FjkeNerl756+
	 DxUng6SyPU32hZ+OpHwBFktTajgIf6RJrVQU8xqzb5mGwciMWb8dyhYgqvNugCSIhTMhz
	 7/Mt5MjtkKFSh6lCgw2rYa4aQVCmr1H4iak4RMYGsUB7DV1Wzkna2fW9cbwaM5kuo/Hh3
	 KptncqD4dTAWFALnJR66HKzGrQLTiwAhNMeFBKTAsoYE9IkRA2SI4eI+NqRxVEafYQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451458;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uad5R2eNu3pr9Vs/IEk7rPF1CVJba69c/w3VjDE6Yw0=;
	b=D7vClqMQtN71CJ62v1wjmaOP3YEzDDwKt6c2sk3tOrwDA0QbqKYXSVWW6EFZnwqZ1MBN
	 RU+2VFcTcwaH894hHiIP/QcYe02cbKPP7EkV7SYCjKpL9rSma4zlF8pKD1A+FtfGXI8lM
	 XalCs1QaKbypP4o0lVTjLFtBUxZkC1ZLUj2RhqEV6fTThvwclmiMVvZDMgzk4/Lw9PsPK
	 6l6a+KGlEL3XD2FCLsp9h2bkeqmaYhBiYDSreYL6xTLkTCwnJiVNYIs5U74rTJzaeKcaZ
	 teKg1kpOkyzeM6An9XeReoPol0c6Pi1uP/6hAPLjKJYD/bJ3rjNynLv1muPmX8n6krA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gBn2do9G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39CB606A31C
	for <printk@lists.linux.dev>; Thu, 12 Nov 2026 02:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gBn2do9G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007C31F00A05;
	Thu, 12 Nov 2026 02:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794451458;
	bh=uad5R2eNu3pr9Vs/IEk7rPF1CVJba69c/w3VjDE6Yw0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gBn2do9GHAN0I0ioBL/zo2KP8R1ul9V3bXelY8jRZ/I7L7gq9qZN62negzUcPyTej
	 oxl9UMf0mavmLs3NyB+lOwItjOT5BuZen9eyH3WIcD/s58flfi5TsiEOFIm2Ly3rRq
	 4ZoGoM/XJ2cjNCSMsDj4s6pG4GXN2NdPi4SHB8bZUFPGcEZ2yVPZfTxEWg3yb4FC0G
	 SEHWpCmVRTVt9qnRUDUWRzIefkj1ts0hZ7S4VEGhojvqEBqKlCAkgNqDpRHjfWSdKJ
	 OyWTt1Mbynx5awUAMO/XAyV9VMw6b4etVqVt1SK2CxndQ7VWOI2YI+nMTEFrGxFBFI
	 dJ+o3BZ7zVD/g==
Message-ID: <sashiko-outbox-210216@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] printk: ringbuffer: Annotate speculative record reads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>, pmladek@suse.com
Cc: john.ogness@linutronix.de, rostedt@goodmis.org, senozhatsky@chromium.org, printk@lists.linux.dev
In-Reply-To: <20261112022940.118080-1-zhujun2@cmss.chinamobile.com>
References: <20261112022940.118080-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 02:44:17 +0000
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
- [Low] printk: ringbuffer: missing data_race() around
  READ_ONCE(info->text_len)
--

commit 7288fc8cb2d6c1c58a2fb9813dc051688ddc5e44
Author: Zhu Jun <zhujun2@cmss.chinamobile.com>

printk: ringbuffer: Annotate speculative record reads

This commit annotates speculative metadata, text copies, and line counting
in prb_read() and copy_data() with data_race() and READ_ONCE() to suppress
KCSAN reports when a writer concurrently recycles a record.

> diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_rin=
gbuffer.c
> index 57cf6f4e298e8..10189a9d3cb49 100644
> --- a/kernel/printk/printk_ringbuffer.c
> +++ b/kernel/printk/printk_ringbuffer.c

[ ... ]

> @@ -1984,12 +1985,13 @@ static int prb_read(struct printk_ringbuffer *rb,=
 u64 seq,
>  	if (err || !r)
>  		return err;
> =20
> -	/* If requested, copy meta data. */
> -	if (r->info)
> -		memcpy(r->info, info, sizeof(*(r->info)));
> +	if (r->info) {
> +		/* The record may be recycled; the descriptor is rechecked below. */
> +		data_race(memcpy(r->info, info, sizeof(*r->info)));
> +	}
> =20
>  	/* Copy text data. If it fails, this is a data-less record. */
> -	if (!copy_data(&rb->text_data_ring, &desc.text_blk_lpos, info->text_len,
> +	if (!copy_data(&rb->text_data_ring, &desc.text_blk_lpos, READ_ONCE(info=
->text_len),
>  		       r->text_buf, r->text_buf_size, line_count)) {
>  		return -ENOENT;
>  	}

[Severity: Low]
Should READ_ONCE(info->text_len) also be wrapped in data_race(), i.e.
data_race(READ_ONCE(info->text_len))?

Under KCSAN, READ_ONCE() alone still checks for active writer watchpoints,
so it can still report a data race against the unmarked
memset(info, 0, sizeof(*info)) in prb_reserve() when a writer recycles the
record.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112022940.1180=
80-1-zhujun2@cmss.chinamobile.com?part=3D1

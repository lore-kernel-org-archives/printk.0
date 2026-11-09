Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230960;
	b=UIlTwV5wvgtleAB35NRIp32IZtKIlP68Kpo90y+9qeKSJFoa6muntH+wkINnwySqbOJJ
	 z+1kU9AKrccjrAxmIjmx62Wwq90lixMARNMkBDltCfZk0Z29C8CgxN+It+bw/U9MtNBDE
	 hD1mAN+BPHrwCbKUZ0+WgRWmJODALF5IfjPJDdVT0F49dhitO9nUwiww6510z+FJ510Zd
	 wgH1I2ZnOfqzIJPz6L7Hqrbuxe0JHH68SoBjVJyZ3xIXedqRR5cQNu/1B4ryioIGzq36D
	 yL7xsL6kmfs5sCAmIIx6N4TQLZVNli8658j9kjs4tEoMvLH4nBxn20yeW8ErNS7o9XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=p8KeZQ1gDNMPi4Q0Vpjy/FG6SeCgCptXYJ2kECeS9lk=;
	b=Rh9O5B0oP3HTbEVcr071u6lmbTbvrWPqwRPQPbiYHIcTPfzZh1HeJCJQa6fK3HPSIwx6
	 d0muZCvf/jPRGiNMvEmgb5K077ldjYP8bPofeuheQ/PrkeWt9YFTA9WRdHBcnm8RYxSU/
	 TIJOramN9Xr2k4HuA3CJPyWxVJ0aMMvfcbsJZBv4QSl50RxfSA3NII2HGIuMHzSfyP/Xk
	 eIqTcjadm7SG9XhwVdnhtQpUnzYuCVjjf0SnsyulNrW1+LrzskC1TTzNQb5i8JJqRBq4j
	 1eWh3IKf6541wvi+556XbdIB8e2KkBQvM8Fz09dczd7rKtdEc9PocWm5dKOVtl+VBNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=V9TQhlQy;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670A5606A323
	for <printk@lists.linux.dev>; Mon,  9 Nov 2026 13:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 670A5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=V9TQhlQy
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so9061115e9.0
        for <printk@lists.linux.dev>; Mon, 09 Nov 2026 05:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794230959; x=1794835759; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p8KeZQ1gDNMPi4Q0Vpjy/FG6SeCgCptXYJ2kECeS9lk=;
        b=V9TQhlQyfTKWphXcorF5a6gXcL5MBWQrGz0bHsUpFgragi5NnZlvU2cMTweH3ZDl/g
         X1V+Prw7MAtIHE5rDZVgKdyUWTLRNoK27e++VQFTPFfRaI7Sv+Ut0vk1Z/PWyblGhr70
         q+oDSBS1Tnh7t9oCPTUAKUXtc2QlsDdxaTQZI8RuxPXpf6NW+UAqw0SkoM46nJLuvYOk
         hWhTj/72DQt9p0G5oSgUo3GQWU5Vz7XViwju41KO8ms2NYVVi0EP0wANXlPaLGD13kcu
         3P5njhVXKnkoXOcOOpe+dgJkdzlDxvMU+EGh0x2h0uliwPY0iFpvmt/0zvAJE2IqhLaI
         pFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230959; x=1794835759;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8KeZQ1gDNMPi4Q0Vpjy/FG6SeCgCptXYJ2kECeS9lk=;
        b=EnK6oYJoDoEF2Jal8ImG0n4jGGnTgyUv2gxYziDpMxr9GkUOwMo6fanVFvpJ4T+oas
         ponXrl9A3/SnhpLL8Wj/a6NmSaR9B382Q1mu3Ju/Vz5E3t7stxCJYRqe/axDt5LDyWrU
         fwvV0EBq2OF+R5jlrdNQkOum22sv5sz4VMyXQQH8GxORXYFRzsKzzAjPhdU/kJeE7UPs
         NpXTMguMrhl7y36JqBBACQ8r4vTIuG7Yc6V8H/i6/q8Y9RYA2pJCSE2zpOPRhm+srXmx
         mKSozgO68OQ6KVLmszBirjsu/JrKRd1zeVcodUgDw9KYHf0sdW6GYTFtnWfSOEzqHMGU
         Y3Wg==
X-Forwarded-Encrypted: i=1; AL+hErFZrr3pR9He4PgiqragkDFewjfrsoa2aA9z3CHy0K05WbV5FxVuqcmCAfdcxls+VMOGes4fVD8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/NYeSY+KjgdCm2kzLthj8+DAinIlS1q4sk5Kp7e03SdRS7mxuK
	FLmSfFPn3DR0DejjXN5/lCsVSaVaNXz6aOvv1jCj3hdsyM9i4mzmIOUg1Y5fjfLfbk4=
X-Gm-Gg: AYBFou2SIEakg5YGiJjnlskf5ntlzyM0+SkEaUqxMsvyHf8ajzvw6y7YFgFJUD+nqMH
	Z5CWxYDlWE/rxf7HRCJmmXlDHurnn5T1ZNuxuxxl8SyLq/LPA1l8rCgx/glOXLLVHuaVUW6tIpf
	csy8+OJfcFEhFlgp/Sy0gRW4S+geEpK+Jfwuz2OJjmXUSrYNBuKpt89IB6EkvwHjZYDYicoW4eX
	K6YdZ9plrRE6KIXXb8SL2szJ40rTmRGaz4ZT4xFAmUJNpPzRIg8bT8K/Ylp+kAdOC5MU1b4bDbg
	ewD29ZDuztyMb8iGFiuAjIHbaQP23cyFxKSOTFnK5lXRkyL8H/1FETWt8nD2UvnGgUjSo1wba7H
	zRSLgzNOTV1gJIsq/hcPJ+WZezpXzfclbN1olU4gYdqaQr/64HWMQLxCdTDykjrXVNHHBSg6xAp
	jMIaS/af9dfs69HOvqvtXHP52kfiWIJjHHW5pZJ9ern8LEJAHQNeFriIKdUbJvEHyL8ll45xGvC
	68Go2ZpjvWfbiwWRt5vn593TnDqcb4DQWwJkn1hhArdCjFEKwNtn5EXRWjVE/rjL7eLvxgxRLhU
	cRtimerGWQbqmrsdsFuAhQ2or5q+8A==
X-Received: by 2002:a05:600c:46d2:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4b963c814c8mr73950475e9.14.1794230958732;
        Mon, 09 Nov 2026 05:29:18 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm244819165e9.13.2026.11.09.05.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:29:18 -0800 (PST)
Date: Mon, 9 Nov 2026 14:29:16 +0100
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev
Subject: Re: [PATCH v6 04/16] printk: Separate code for adding/updating
 preferred console metadata
Message-ID: <avHKrPxxBDIuHUBd@pathway.suse.cz>
References: <20261106171952.207909-1-pmladek@suse.com>
 <20261106171952.207909-5-pmladek@suse.com>
 <sashiko-outbox-201935@kernel.org>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-201935@kernel.org>

On Fri 2026-11-06 17:30:05, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] printk: malformed kernel-doc comment for
>   add_or_update_preferred_console()
> --
> 
> commit 53283e23ffd138683d26af82f710d22a050dc49e
> Author: Petr Mladek <pmladek@suse.com>
> 
> printk: Separate code for adding/updating preferred console metadata
> 
> This commit splits the logic for adding or updating a preferred console
> entry out of __add_preferred_console() into a new helper function,
> add_or_update_preferred_console().
> 
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index 27bf77a777a2e..24bb6f63c070a 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> [ ... ]
> > @@ -2543,26 +2544,34 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
> >  }
> >  #endif
> >  
> > -static void set_user_specified(struct preferred_console *pc, bool user_specified)
> > +/** add_or_update_preferred_console - Add or update a given entry in
> > + *	the preferred_consoles[] array.
> > + *
> > + * @i: index of the entry in @preferred_consoles table which should get updated.
> > + * @name: The name of the preferred console driver.
> > + * @idx: Preferred console index, e.g. port number.
> > + * @devname: The name of the preferred physical device.
> > + * @options: Options used when setting up the console driver.
> > + * @brl_options: Options used when setting up the console driver
> > + *	as a braille console.
> > + * @user_specified: True if preferred via the kernel command line.
> > + *
> > + * The function adds or updates an entry in preferred_consoles[] array. Also
> > + * it updates some global variables which are used to make the right decisions
> > + * in register_console().
> > + */
> > +static int add_or_update_preferred_console(unsigned int i,
> 
> [Severity: Low]
> As reported by Chris Down on v5 [1], scripts/kernel-doc requires the opening
> /** marker to be on its own line, so placing the function identifier on that
> first line causes the parser to skip this kernel-doc block, and it is also
> missing a Return: section.
> 
> [1] https://lore.kernel.org/r/auLwTYSza9exX3ba@chrisdown.name

Ah, I misunderstood the probem. I added an empty space after the
title. But it wants to have "/**" on a separate line.

Will fix in v7 or when committing.

Best Regards,
Petr


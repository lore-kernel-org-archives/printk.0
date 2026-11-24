Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537670;
	b=XIeM6079reJ1/mH/2ofdJX8/bns9IkaxwHT1DE/jNLT8FOXkJ8+i3Ws2gzBihMnDAOn5
	 FWiINdkCJK+KZ9G1S7xXYRl1wmezmdBXB2lbycUE8e2Wwbu/a24jG5qm2qHGoJUuyI53I
	 FhKx8DQg6WllgyNS+v7KGTxXHc1F0HTJwrMQ4fbf+aWw/u8oWolO45N3ddBN6CwvMQ3hS
	 4/5jbWs/wIxV/u9yEBnQ0cGUahyOfPnnsEwjh4wZv8vr+5sV9CQWBbRRnV9At9dXY+I00
	 6T0Lz3yliE7Z1qZrqnQFTgLwrR5+nzxL5Xbt6WFH9BEamyss47Y3hbSZKjTJNzhJmmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=R3zuLxf28X0H/xa7T47tiKvpemvGGgA/Y2mqSnzT7Gc=;
	b=wDEPwommgrYAjC6U4HhF62LRZ32kJxSFIdA82ytPmQxqU7rPPqzsumH4jpvWjhSRcKlp
	 hDA62pnDFyfdTGPdQ7oXWKKDyQo2bF8HZXYTuR1SowaK3iqSnxrcouuG3fdRkGbuFbFUL
	 65Ksu3/y0J4pxw4/i83egJFtTRCSsZJyX4pELK6ZzGaCnwO2IodsA0UCy7nNhfGIKotcF
	 4RhSEV5WT+0k4PWtj/zEeukzU0WZlY6TMGnwj9Bd78lK8EJF55jtcd5weD/wsPSZPpKMj
	 FNXoJ5eM9SwZUQZCOf8oe3rEA88W+M1f25YzJ6WaEexutN5EI7FADURhZ847zqvEPZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PxHkQywh;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7922E606A31E
	for <printk@lists.linux.dev>; Tue, 24 Nov 2026 16:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7922E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PxHkQywh
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso4075371f8f.0
        for <printk@lists.linux.dev>; Tue, 24 Nov 2026 08:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795537668; x=1796142468; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R3zuLxf28X0H/xa7T47tiKvpemvGGgA/Y2mqSnzT7Gc=;
        b=PxHkQywhtXv0mTEeVgmvoRc4jCCdz+O2EIRjwF5e+aASrFExkccv1koWqN1bvq+M7U
         BpoeduYDNdP/L1cRc70FpGRldnqhYUKh3yJd8+db39kq6r8BeL90Mf+iM4WT1LBz9Uq1
         +8JiyHZOCXhBwaT2fkbYvskS4kTNxVdNORTFUg/ZD08LQqdcd+sl/mD+M3QPf8wzP7f+
         RXPAlj+pqu4Zm/MwF2jQnLjYKFIHqXHSh1AryQi00t9UwNWRyFj5vTddBDwIjDh4SQO9
         /Oob/TVf8u7huooJlJHy2Xx3aefW/mh1DLsLRE9swQUEgaaLEUFg7ZCFuO3Ker2iO3pv
         NfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537668; x=1796142468;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R3zuLxf28X0H/xa7T47tiKvpemvGGgA/Y2mqSnzT7Gc=;
        b=wwqfY6XFB/iYI0fcqGtz0U2omLLBwQkE8ENRQZM25hUZtyDUEkxLaTH4jR5RA6Mb2T
         eWA6umDJSbuNkdncsoMn07DQp0PX+wo9tUOxXjjXXEVffNGkkdILqn6pgsz3I1uoT3HR
         pyIDooyvJm0lIzgi1ioUG/m0teQyicQ3pINfgANYbQYq9fhejoUyTeBiWy8FEHaIplgZ
         hn9XO4OYwutKm0LIowO+KhDwsxxYtUq688Yn1XPWgjbWrcfdTCrp7w9x7LQ1YTomwYlC
         xOA5lawGS4Xiumoyjeh0Ay5gy+xdKbyriak3VQCRIcm7BxpGsdmXPzXMdHgz3o13NiGz
         yXmA==
X-Forwarded-Encrypted: i=1; AL+hErH8HLCKFRaed/hryv39IeLZNZeEej1fYwMukIGemD77v00BxIDQPYzYa+ZU8ZCGndjltn8EeyY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9VUhwg59zDwcT4XozH0oiFXyD6v+GD5krS9d72j3Fq+9+r7ig2
	75w0AUHtGOszeQfQuFU1aGz1H8phLtvIqN1HzlBy1qX3yHNfvUR4ioVXqCJeQH5t2nM=
X-Gm-Gg: AZFdTZfRTG7sjl6kZLvRS/tkDRZ8MeSgZrpw9MT/jV7ysWJfmb7r0UtAb+NFl7cxUpV
	wIkl1412YoQ2B2dMjDWlLigX17MBDtGCog0uMDLsA+oRK/Ag5efois4Ly+/GjpWFO/EfZMeywGB
	znFYfHv409YIPEqociea4A578E8HUhjLl4ySe8ZP/pXuGTyM3jU/Rk7/InjkCHgUwAHE1EvLUxk
	ler0c1FauMTABmL/xrWq0cc0i4EEV7qf4DfDA5sEIwLDGD6LXhS/iEz6vSVic0hVKy27X5UTg1D
	JiAhbCDy+88Xt4Ef1jmzV/oAnu3GvkmgH8Ync9hKSYRiVHiVI6/OaJKmg0uLolxz4HkZXPlljLa
	FtGrJ+aGHjOrJMosyfQhPzVzYF81j/tBQvgiTHd/3xqS71btSlTTnS5ZxJZwuqzdZnEVwfNHyLS
	ePPuCtQBD82oGAd/67sg7b6TLyQuNnBNLo6j7E8bQd7DFYYQtKmEikI+5tA5w8uFfNXcW3qULaA
	daKQGRaxoCglDvwI06zS/qyCYEtDwr4xUkkSTqX5W9/IbNb4TlO40IyJv4PAquLhLm2lWLyWzrQ
	ZAOq/Jq8ltGOj4h/JCZN79SDi6pGMgA=
X-Received: by 2002:a05:600c:8b11:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4bb8881d194mr319287845e9.27.1795537667763;
        Tue, 24 Nov 2026 08:27:47 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm29083209f8f.50.2026.11.24.08.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:27:46 -0800 (PST)
Date: Tue, 24 Nov 2026 17:27:44 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v4 4/8] printk: nbcon: Use @reason instead of
 global variable to check flush policy
Message-ID: <awW7AFsiUkhRWdqy@pathway.suse.cz>
References: <20261121163557.963029-1-john.ogness@linutronix.de>
 <20261121163557.963029-5-john.ogness@linutronix.de>
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
In-Reply-To: <20261121163557.963029-5-john.ogness@linutronix.de>

On Sat 2026-11-21 17:41:52, John Ogness wrote:
> Currently nbcon_allow_unsafe_takeover() is a hack, relying on the
> temporary setting of a global variable @panic_nbcon_allow_unsafe_takeover
> as a gate to determine if unsafe flushing is allowed. This hack works
> because unsafe flushing is only performed at the end of panic().
> However, this hack is _not_ sufficient if unsafe flushing is to be
> allowed in other contexts.
> 
> Since at the end of panic() nbcon_atomic_flush_unsafe() is called with
> the @reason PR_FLUSH_HANG, it is possible to identify when unsafe
> atomic flushing is allowed using:
> 
> 	PR_FLUSH_HANG && panic_on_this_cpu()
> 
> rather than:
> 
> 	panic_nbcon_allow_unsafe_takeover && panic_on_this_cpu()
> 
> This allows removing the global variable hack and opens the door for
> unsafe flushing to be allowed in other contexts.
> 
> Provide nbcon_allow_unsafe_takeover() the flush @reason to implement
> the check.
> 
> No functional change.
> 
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1453,24 +1453,31 @@ enum nbcon_prio nbcon_get_default_prio(void)
>  	return NBCON_PRIO_NORMAL;
>  }
>  
> -/*
> - * Track if it is allowed to perform unsafe hostile takeovers of console
> - * ownership. When true, console drivers might perform unsafe actions while
> - * printing. It is externally available via nbcon_allow_unsafe_takeover().
> - */
> -static bool panic_nbcon_allow_unsafe_takeover;
> -
>  /**
>   * nbcon_allow_unsafe_takeover - Check if unsafe console takeovers are allowed
> + *					for a specified console and reason
>   *
> - * Return:	True, when it is permitted to perform unsafe console printing
> + * @con:	The console to check
> + * @reason:	The reason for the unsafe takeover
>   *
> - * This is also used by console_is_usable() to determine if it is allowed to
> - * call write_atomic() callbacks flagged as unsafe (CON_NBCON_ATOMIC_UNSAFE).
> + * Return:	True, when @con is allowed to perform unsafe console printing
>   */
> -static bool nbcon_allow_unsafe_takeover(void)
> +static bool nbcon_allow_unsafe_takeover(struct console *con, enum pr_flush_reason reason)

Nit: It seems that the @con parameter is not used in this version.
     So, it might trigger a warning during bisection.

>  {
> -	return panic_on_this_cpu() && panic_nbcon_allow_unsafe_takeover;
> +	enum nbcon_prio prio = nbcon_get_default_prio();
> +	bool allow = false;
> +
> +	switch (reason) {
> +	case PR_FLUSH_RUNTIME:
> +		/* Never unsafe flush during runtime. */
> +		break;
> +	case PR_FLUSH_HANG:
> +		/* Always unsafe flush on panic hang. */
> +		allow = (prio == NBCON_PRIO_PANIC);
> +		break;
> +	}
> +
> +	return allow;
>  }

Otherwise, the logic looks correct.

Best Regards,
Petr

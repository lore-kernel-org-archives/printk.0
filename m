Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582351;
	b=XJbt82M76IwiC5bnkZA214KGS2MVTF+n/5/fXe+/rR+iZcldhhuRiE5orrMyN2n2c55e
	 Ohld3Chcwr+VUxeaL1h0ttAFkIwUsGyDpEUD8iPrD3W29qDdkZ+FPWRSkSQq+E633NBrj
	 6KE5Y3AyN2WYz6rP3g9ltoc5X99JLS7wfEFHoyY453JRF94Qdd0dVqFgsUq/Yi+qbm9oE
	 y86yLdHoBMsIKNk8I28le6w2hPudmY4HzFho1OC7JHfHOgTN+ucCKXEI1n7XANC7FhN8G
	 xqvJ4ecNT+POuw9CFb83xN2uIewEdUMtc+Dy9sEKq5ClCU8uKpKRqXuNl70UKYy4blA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=x+Xd1db6zPqMxOaxpQfVku2qqOYSO4cm/68ivCtsVLQ=;
	b=sByZ/6EgJqKB7xqfXDeAPrgV763P+gmA8+AruJI5j2RCcl6UA1FpSqsg5ulZrgdXE723
	 iLFXx9xekSuVSOBJL53DYUZFd5U6CwztWN7hcXtOhXZDOMrIds2gmihoWnSAt+knHUQfK
	 QtSVtFTgelNawipctwMgyv8vGg2PvvYvn+1gOiZhY+bDor03yffNYFTwMO7DA7UMW1z+2
	 evfmMPTr2cnBi8IJWix9+39IJ7ZOXrjHPSMcF16bawPkKjkbwrC/0txVQX7fw0N/V7GTT
	 j1x0HV2pphH3JwBeNuQ8B0d3vDqAqLyMPLRv+0BP+z1bXzZa46aO1lGlPVeB+7Rhpwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WPEmf0ms;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DC0606A330
	for <printk@lists.linux.dev>; Fri, 13 Nov 2026 15:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37DC0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WPEmf0ms
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b467581b98so8502115e9.0
        for <printk@lists.linux.dev>; Fri, 13 Nov 2026 07:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794582349; x=1795187149; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x+Xd1db6zPqMxOaxpQfVku2qqOYSO4cm/68ivCtsVLQ=;
        b=WPEmf0ms7Wc/Tv1JulbQNgIW+jjbpk3jm9L1h+TEebzXqXL0hb6c8BXhQJ9wLsYEmh
         yaJWL09HbzpC2zRHF0pShcvC+3uebAGMtosuXk0A5r0fBkS0heNjJdLepdOX336m8r3F
         sirZysvMnVR6K+0RErnAKtnQ9m1oc+MaKTIz3uLUzcreYsO8gMMrU2jN4xgpCjr2pYo8
         8ZODKMqYMPv8GncToDwxyQaSI07WkVWIvcRVge/Mz9RyC3O5E8FQ0iMkHn9Ctu80vAge
         A1N6cEwcivMz9xUwr5DOVMjXOaswnmr1C4eb5eBATj9+WGqxNa1SUngh4aqIRttwyZxF
         S3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582349; x=1795187149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+Xd1db6zPqMxOaxpQfVku2qqOYSO4cm/68ivCtsVLQ=;
        b=W64fjZu56jG2DwEVAx0qcLLYXRCowpz6rtnfxRGedlr/lYNnVF5ZZUKaQGJ11iOaZW
         CbRg9o3Py0DTMF8s5hg/Zz3CFqLtT49a/1/zTNWYtgn9YMFuXXGB9ugJaeWh+Ry7tNgP
         eufli9OwDM6b/Io2/98fHphW2adRERbNfbMpRtRFerDUebHLIFgQEkFcVMV92PjSSMGT
         hb6y/AoVh0q0i6N6wLHkvOWcTziiDY+5aoJCkSj7tC11tVp6lcRkzjTWX9EwSdLwQh5M
         b63BQIkADoOEP7yjA4DDRydTFKMQ5uLisYn2yFkKJXdqQEAXLe28+T7Yd891rQO4KHvY
         ACcQ==
X-Forwarded-Encrypted: i=1; AL+hErHqYB3YztV5LBdoDbWcqZyCberM1HhmS1dC8wFgzME5HS71y8IgC8TxA0FoW++JIofEY3ZO/ew=@lists.linux.dev
X-Gm-Message-State: APuU4Z9s/xZ0Bwv/WczIG0JR867aHFo4zUve3IMV5jeEAx9+qsu/Ewal
	F/DEd0n7LZYNM9hAe2DYRmjmZ2dx2WXumNlLCnvhyda+U+jY+SZedoGilma4z0ecFQY=
X-Gm-Gg: AYBFou2Jqms3SjXpjIXYn0Z0QVnG6/L7TrAnTjyOpuVWqZGVm09aT1AN4vGnmacAZ3u
	BOxyAZIdTR7ZRzzyyE15vkgUSX9g0hc8WN0xTeZ04YSrXMcSkpJQ2vg6ei5CBmk9RHB5PEEXQrr
	qAAfcyjJ0sZM+x06ldCuIHg3SQhnpzkonGUdiixs5wSoriLvEPNOs9GS1fMwJoWPKG21xO1CVX+
	AsB/iwc1VFUyaIXPKLgfWWoc0Ez53xPVqyoBus+OoveQpUDymN30BCJrBojBdiyYjP0LK7pqwKe
	v3+cW9MHpe1LivPKcrf6k9TlIHtRY8bWFHotgfISwu+1Gzh/+aCElRuv8vlpYhpBkxekEPzOrAk
	YwngV7wiSp2Wpuarcfw+fe/j+nCClcT6Ro9XmLnhLjRWJSwBtiPRtE5dI3aQHTbEcEqeHWq9Kw6
	GNcSt4v7pluY0b1/llEChlM1RfxGlLk9Xi709RumKAu2WpQdWbX154R/mkLWMkYA9X5zx5MNpO8
	+p6VqJEiZ/h3qBET1k287fTP+BUEqzW0I/tSIi6Jc+uA2ogK+S5lJwpWP8GIvLRO1ESb8n+RzQw
	PD42uelyOrx6g79ph0NQX4Ta6Ykpuws=
X-Received: by 2002:a05:600c:46d5:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4bb55a8329amr58179765e9.13.1794582349341;
        Fri, 13 Nov 2026 07:05:49 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm270777285e9.1.2026.11.13.07.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:05:48 -0800 (PST)
Date: Fri, 13 Nov 2026 16:05:46 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Rio <rioo.tsukatsukii@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	Pnina Feder <pnina.feder@mobileye.com>,
	Gal Pressman <gal@nvidia.com>, Petr Pavlu <petr.pavlu@suse.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Oleg Nesterov <oleg@redhat.com>,
	"Cen Zhang (Microsoft)" <blbllhy@gmail.com>,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	kgdb-bugreport@lists.sourceforge.net
Subject: Re: [PATCH printk v2 1/6] printk: Introduce and specify flush reasons
Message-ID: <avcnSjj2P9UfsBn7@pathway.suse.cz>
References: <20261111181942.593695-1-john.ogness@linutronix.de>
 <20261111181942.593695-2-john.ogness@linutronix.de>
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
In-Reply-To: <20261111181942.593695-2-john.ogness@linutronix.de>

On Wed 2026-11-11 19:25:17, John Ogness wrote:
> Prepare for per-console atomic flushing policies by introducing
> enum pr_flush_reason to classify various reasons for performing a
> printk backlog flush. The reasons are specified for
> printk_trigger_flush() and console_flush_on_panic().
> 
> For atomic printing from printk_trigger_flush(), propagate the
> reason down to __nbcon_atomic_flush_pending_con(), where the actual
> atomic flushing is executed.
> 
> For legacy printing, use a new global variable @legacy_flush_reason
> to track the reason in case nbcon consoles are using legacy
> printing.
> 
> Update all printk_trigger_flush() and console_flush_on_panic()
> call sites as well as any explicit lower-level atomic flush calls
> to specify the reason.
> 
> Note that PR_FLUSH_RUNTIME is used for cases where the reason for
> the flush is not clearly defined.

> --- a/include/linux/printk.h
> +++ b/include/linux/printk.h
> @@ -145,6 +145,24 @@ void early_printk(const char *s, ...) { }
>  
>  struct dev_printk_info;
>  
> +/**
> + * enum pr_flush_reason - Reason for a flush
> + * @PR_FLUSH_RUNTIME:	A flush while the kernel is running
> + * @PR_FLUSH_RESTART:	The kernel is ending, but another instance should
> + *			follow (reboot, kexec)
> + * @PR_FLUSH_HANG:	The kernel is ending and will enter an infinite loop
> + * @PR_FLUSH_KDB:	Printing while KDB is active
> + *
> + * Flush reasons are used to determine if unsafe atomic flushing should be
> + * performed, based on individual console policies.
> + */
> +enum pr_flush_reason {
> +	PR_FLUSH_RUNTIME = 0,
> +	PR_FLUSH_RESTART,
> +	PR_FLUSH_HANG,
> +	PR_FLUSH_KDB,
> +};

This entire patchset adds a lot of complexity just to enable all
4 new policy flags for netconsole in the last patch.

There already have few dimensions which affect console flushing:

   + console_loglevel
   + nbcon_prio

This patchset adds 8 new terms in pr_flush_reason and
nbcon_unsafe_flush_flags just to explicitly set all
flush_flags in netconsole.

Let's start with pr_flush_reason. I am not sure if it is worth it:

  + PR_FLUSH_RUNTIME is the default

  + PR_FLUSH_RESTART can be detected by system_state > SYSTEM_RUNNING

  + PR_FLUSH_HANG has only one caller currently distinguished by
	the global panic_nbcon_allow_unsafe_takeover

  +  PR_FLUSH_KDB can be detected by kdb_trap_printk and
     kdb_printf_cpu, see vprintk() implementation.


IMHO, it makes things worse because nbcon_atomic_flush_pending() has
to use PR_FLUSH_RUNTIME in vprintk_emit(). But I think that we
would like to flush it the same way as an explicit flush called
in the given context.

Best Regards,
Petr

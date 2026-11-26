Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684667;
	b=L2xvMoXxYjrW7AxBW72FE+7nkNYM+cV1wREea6q1pOfhiGNxbFDVdmOW2z+7HhgBtH0B
	 hG8Sb3FqSE4uQk6sksLLlrPpuGZOMKzxAZRVYpyrCq/v8sFcJr8H2IziQvz07Zn06oU40
	 0YiopbGoi03yjnrp/+gur2Ilj/UcIbfjwVUKpenoOCiamCFN52QCZnrTFuyQqMnVuDZkj
	 keDbnNy/VtAXTBfVt4cgzJHoSi116hQD7PzA0HHfbWEizJqKiKpqyvDdvlHO8FAOmfkjN
	 EselZa8aQhUDiMcQl0VPn+dQ7kkdzKk8JQ8yrJyiBiLEEYZRh1SbUlvupIYs5GSNLVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684667;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=Vs361lXj+ccNg7scnBDY+PPWxIYArALWaEjIZmnxvHk=;
	b=iIRpYCfm8W+HdiJEOLnBkqHfwOzDdTZS4Lvr+9tm6v2PoXepLZd7UJc71aEa9WCPagL8
	 WtKdwZfIHa/x+WMJ8dCPAbsaZrIq4pujileew8t5hMDOBKgGnWvxqi0cHo+1Cino89aU9
	 3wqfFqHApCT4JUMni8bHhy0S+cNTumNEvr10j7yXliC/zKNufrdE/3lY/urRiRt8oKbFB
	 llRg8AA9TZdkfXH0ZNn6ze0rmHaCtY3oMf8sjsNlLWn83ObiSStKXLPeCgNMtY8btDN1y
	 eL2tcysaqXfsHPTdO0agq0JwXeYf220oI3Ahy/bAEWyK2VrgCjCJzOlnNd32yrAPkPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ugpoMvB1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=R0l4rrrh;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01DA606A31C
	for <printk@lists.linux.dev>; Thu, 26 Nov 2026 09:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A01DA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ugpoMvB1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=R0l4rrrh
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795684658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vs361lXj+ccNg7scnBDY+PPWxIYArALWaEjIZmnxvHk=;
	b=ugpoMvB104v1IFEPAMKVK12DkzSBS6mF8OgMJD4beo3Q9zmHyRBKj5wgupOe+dSpS/CmFr
	7HHTs2DnbSPuXsZtJSH/tFhXL4xlnoWHkfuwAmciudzmz9CoN3lgp1CxsbRguAGcXPpLXG
	WS43r5N15ykgZ1FkRuIcymrUfzYl343S3tA7AgeB2Ejb8oImA53Tl2f+34OQok+JHMhYME
	4/aqZ/9wNDSeN6Nyu/l3xJ7RUX/5ZxFVX0VV7TD5bCoFDopxNp2O7s6nxBXWMeSo3CxkAj
	p3yaD7Zy22AtW5j/J9AJL0kx0jTyBlpM759r5bppOLP6AEuzaCw22oLVOBcFEQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795684658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vs361lXj+ccNg7scnBDY+PPWxIYArALWaEjIZmnxvHk=;
	b=R0l4rrrhC9f0SV5yuoPTLTCiphRf0KYxzJvKAZ3GhHzaOWsX2yx4+SDKWplkhjsBF7GFCG
	29az0nrU8mWqIwBg==
To: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>, Petr
 Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Jason Baron <jbaron@akamai.com>,
 Andrew Morton <akpm@linux-foundation.org>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
Cc: printk@lists.linux.dev, linux-kernel@vger.kernel.org, Philipp Hahn
 <phahn-oss@avm.de>, Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH] printk.h: fix overzealous pr_fmt in pr_debug_ratelimited
In-Reply-To: <20261125-pr-fmt-v1-1-3ff6832f5a50@gmail.com>
References: <20261125-pr-fmt-v1-1-3ff6832f5a50@gmail.com>
Date: Thu, 26 Nov 2026 10:23:38 +0106
Message-ID: <87qzg86jf1.fsf@jogness.linutronix.de>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-11-25, Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org> wrote:
> From: Jim Cromie <jim.cromie@gmail.com>
>
> Historically, the CONFIG_DYNAMIC_DEBUG implementation of
> pr_debug_ratelimited() passed raw fmt to both metadata and runtime:
>
>   DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);
>   if (unlikely(...) && __ratelimit(&_rs))
>      __dynamic_pr_debug(&descriptor, fmt, ##__VA_ARGS__);
>
> While descriptor metadata was clean, emitted dmesg records lacked the
> pr_fmt prefix present in the !CONFIG_DYNAMIC_DEBUG fallbacks.
>
> In 2015, commit 515a9adce0f0 ("include/linux/printk.h: include pr_fmt
> in pr_debug_ratelimited") fixed the missing prefix by wrapping fmt in
> __dynamic_pr_debug() with pr_fmt().  However, it also wrapped fmt in
> the metadata macro:
>
>   DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));
>
> This causes two problems:
>
>   1. Build failure when pr_fmt() expands to multiple arguments, e.g.:
>        #define pr_fmt(fmt) KBUILD_MODNAME ".%s " fmt, __func__
>      Passing pr_fmt(fmt) into DEFINE_DYNAMIC_DEBUG_METADATA() expands
>      across the comma in DEFINE_DYNAMIC_DEBUG_METADATA_CLS(), supplying
>      4 arguments where it takes 3.
>
>   2. Metadata pollution even for single-argument pr_fmt(): baking the
>      prefix into .format breaks anchored queries such as:
>        echo format "^foo" > /proc/dynamic_debug/control
>
> Drop the pr_fmt() wrapper from DEFINE_DYNAMIC_DEBUG_METADATA() in
> pr_debug_ratelimited(), restoring consistency with dynamic_pr_debug,
> dev_dbg_ratelimited, and net_dbg_ratelimited.  Update
> lib/test_dynamic_debug.c to exercise pr_fmt() with __func__ in
> pr_debug_ratelimited().
>
> Reported-by: Philipp Hahn <phahn-oss@avm.de>
> Link: https://lore.kernel.org/lkml/a5e3c89fe5f4126873d58dd3472e66c56550ff91.1773779753.git.phahn-oss@avm.de/
> Fixes: 515a9adce0f0 ("include/linux/printk.h: include pr_fmt in pr_debug_ratelimited")
> Cc: Jason A. Donenfeld <Jason@zx2c4.com>
> Cc: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de>

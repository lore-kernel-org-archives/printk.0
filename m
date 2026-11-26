Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705261;
	b=BvQgm4YKQM2cDWafn84Sx8/aNvnA4JAvknNCjWdZjnoetvjfCfxUS128mSvjMqW+036a
	 DD76Rp0JHOGW9GoHPVelax7e+dec7Rzrn7IWXbWLSjxhgq/LeBkoyEGGBcgEk+ogeingt
	 X+SbtpsQ2XoQMDLJ/O3RkZl6LbJL5fxCgHcLo6a/DthF764kD8pAo4dsSzzX7rpQ4J4XY
	 9h1ibSCGv8JzY8ljNSs5fL/rCCK7l9vtbavzwl+VJtYuq/nD6BWo3UJPDXigTcLw87+TX
	 hn/vjOgaezErXVkpmKww8+kVzTodUjcMjFFdCXHS3SGvVGP+0/ImiqYHSsZQFEPH9pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9KeWf6go4A5Nn7MqAkyc2ajXlZEzS7uSzF0B6BvUuPg=;
	b=5kU3MnsWVC8swwD2MPIBA4f2ZmojTCUhDjmZAn3d/BlB1rw+rGXmnCHjhqYR5SUNos0E
	 DTXREZv9AM2tu8tuYJ5s3N79sC0RifBWxA0hUrbIXGUBsSdRay4TaBreaH5f7N7ifdEqU
	 +5WGdA7MVr2GGWmr5bQuU/r0g/dtBpuheaxVBX+fKwuGgy/zmj6/aq0F1DsQt3OMzsGBq
	 nDtvUi9BWbuOIFgNqY6dx++/imQ4YDZiqvNM47kLSbw6kFdVQA4FDPSVJFfsvilypURXT
	 tC52QR9wpMnUSv+N0EejRnDy2puHPxlLVxRvusQiS2qCWhXKOXIONOTyMlGvbge2mIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LDx4yeyM;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A5F606A32E
	for <printk@lists.linux.dev>; Thu, 26 Nov 2026 15:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3A5F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LDx4yeyM
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so6397441f8f.0
        for <printk@lists.linux.dev>; Thu, 26 Nov 2026 07:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795705259; x=1796310059; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9KeWf6go4A5Nn7MqAkyc2ajXlZEzS7uSzF0B6BvUuPg=;
        b=LDx4yeyMOrGu/DXz1lucctVE4AG4H3HvmpoGeiLiBCGGngTB1VqtBba7PEonX3AgX+
         rIQznmmuMadDDeAq9uFYLLXANwGq/rVPrH/nAa7enlIhEO624ZnEbd2ZBHRFXDykcWIl
         XjP2vslC1LHZ8UO7xELVlMS/VzuOncDIN54L/+JZoyonetuLvyJL2eL53s7pNHYv30L2
         L5xB/cHEj8CNyuE1wCgRCvHoS0w1BrzQTe2NvSE2sQtiH4MSJEKYDTpI39x1HapxHwUw
         8vVARQLM1dGUhMUQaRIAREZqJYXSwBGQnQM+3GH93auDF9CmRv36tndsdNeo24n4WKKA
         zy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705259; x=1796310059;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KeWf6go4A5Nn7MqAkyc2ajXlZEzS7uSzF0B6BvUuPg=;
        b=Ou8cMBzIw4jtSboF7rtPPq0cOlHesQby+ZlaXXGtDlMh7GU+gIsK450L/gc5a7iT/k
         2EL5xJfkHC8dqKlsJit6sT4ibPk5dtJh6zKdQTY4w2UbK6KPCn4v4jMXP9dxs5MjHoxv
         Z6A8ucxNUqdT0hd7r8ywsaDTv+BvAd/KSe+unqV8H1T1ZBHswb77TN7poWTERo0ExlmH
         LOt5XNCkzXj8RC+gb3zKDWJ8aJvE4tc1INYSwEq2LWrVCZlC0lqDM+tB77NXoUgD2Rjk
         0uNYKjAsIq5Y7iofOvt1NKHPXI/hgAcweBS6CsQ8AJT22U7p0e/2TFH1PpcMqfir4EBP
         pdGw==
X-Forwarded-Encrypted: i=1; AL+hErHSi8kA9jAFOZD0k9A59ksuG9AwpzUqXmnxQeLYbfQWIgPsR8fUUQxKunr3gLmj8n7bAonzvZg=@lists.linux.dev
X-Gm-Message-State: APuU4Z9mQcxzVEXZuHaMKf9mSDjyI6mS9EblWocGp3S/IOpUDoqL/Ux4
	y6tXJbuvlA39tTjUVaKeLgO7rmYv6x3FMwxt1r9xwSR/BRsllh0QLmiAm145NgfEJTs=
X-Gm-Gg: AZFdTZcvzldSvDiqo0L9v079vlXeLkLeq1+K3Prort8ijQ5aehhbzCZRwJubT7QoKOa
	HoKnuNqeD8QpztbkfNky/hF8aeoyaIWQTwrYm5UfvsotV1ZGlSF3FB2w/pIKkJ9YeEP9Otkj/jT
	txvze5fuhJ++fBJXGZgTqJCyrYQI9y8hsigq9k4ACD4gPBR1ySTeWfNHJmsR63SAF2tvDFapHRi
	Ys9sRioLtrXeMC7xATFkR0Vym3DYZp+gq21Jzh7z5+wxk97fqb8O1dJhIoVhMF/ExsbsSiwhBYr
	uiHbf2ZttiGyiaI1JTXj3D4sf1SF/ueR4hgrYJOtHV9NhWHAQ7vChaLmBMrDgsOculzt4E0GQBk
	4j7M7GeEVkUfit8GXBzfNX5BsfRIQJfqvriAQIPmwrTXufa+UXpWbukw5zn6ftE76Y9ErnnncoQ
	XxEpanJnT4OTPSLIWG3mbxSPWbMEgzTmlXOftphgLWqCk7Q2I5kUs7MmO9cdymQT/QJxlP/loqx
	JxMoOkOsKQ29JaIOETIWZL/l0NHABrZRKPMSzyWWpvJmGjJnt68wCey71a3pNj55+UMm8wHoMXS
	hGouJgTsk2zG/mUP9Qzl/Ix5AEpSV0g=
X-Received: by 2002:a05:600c:5246:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb88930707mr458102315e9.26.1795705258195;
        Thu, 26 Nov 2026 07:00:58 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm631523885e9.3.2026.11.26.07.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:00:57 -0800 (PST)
Date: Thu, 26 Nov 2026 16:00:50 +0100
From: Petr Mladek <pmladek@suse.com>
To: jim.cromie@gmail.com
Cc: John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jason Baron <jbaron@akamai.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org, Philipp Hahn <phahn-oss@avm.de>
Subject: Re: [PATCH] printk.h: fix overzealous pr_fmt in pr_debug_ratelimited
Message-ID: <awhJooa6HkPoKqSH@pathway.suse.cz>
References: <20261125-pr-fmt-v1-1-3ff6832f5a50@gmail.com>
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
In-Reply-To: <20261125-pr-fmt-v1-1-3ff6832f5a50@gmail.com>

On Wed 2026-11-25 11:12:53, Jim Cromie via B4 Relay wrote:
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

Looks reasonable to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Jim, should I take it via printk tree? Or would it be better to take
it via another three to avoid conflicts, please?

Best Regards,
Petr


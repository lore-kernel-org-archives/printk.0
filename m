Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713921;
	b=bA/yInmuldn91A/pZSoMPzFb2la2AoFBO/178w7ozc2Side2smsuNI33k2oDyyDH0Sn9
	 IQWFGpWrXiqFzA2+SGA83dYR3wHOhM1fFMt+2NUvu8CwFrKJ/iFrs7Hyt4WxLigqGoJnv
	 aXtj4+bp+NLbn5aytZpf5svl8CTrc1tdulpZtG/fpAPpNPml1y6XkNrg94yTDPjZJLc7o
	 YladcV8BPSu4oMOKFKWhy1Q9m70JqRoBujgIq5PIVPQUN/Yd5KzVCNTQPcBBTbANSZ7ew
	 0JXNj3SJsbS+CJnWCwQZykDTHSxyaUtjQ6uvs9ifbDXROzFhEGcxMyAYA//7xsl0BnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=B1Q1TGLPbIUVWrlqriCkZBVHwkEIWrEvexoFYfF54PE=;
	b=M2OEHK6Bj8lEIFoFh/GQVDqxkXhk7MohoaoKU8H7O6TVpNxB9pYbq41qesFbBiUs9BaW
	 9g11LuZagi52tyaM0SbaPjMA80H+qFwVj1iOzlo41QaG4rZx16VQ0ao42jetkcIsSQkwG
	 tk1NRTYAjV2bLpvDZEDs0VB+RA0fErZxTRLZ2d2xMh/lRWCIFOGeEGIqP+srARetwuVda
	 fXm/6l7hlWYgNyze0+IhwPBJoF6o7v0T2MVT09W2UJwuW2z1ya6YMG4rDN/z+8F0SaGoU
	 Z2/Im4jpsxmWVnB2+c5i/YsUMi2Dh/6nKCYpznhXFXj2wjbNL5F+zvXacLtykBqfYBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="ftmBIw/a";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFF5606A326
	for <printk@lists.linux.dev>; Tue,  3 Nov 2026 13:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEFF5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ftmBIw/a
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so31829785e9.0
        for <printk@lists.linux.dev>; Tue, 03 Nov 2026 05:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793713918; x=1794318718; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B1Q1TGLPbIUVWrlqriCkZBVHwkEIWrEvexoFYfF54PE=;
        b=ftmBIw/aya90EgxMTitAdEqsL9n1t6syqgY0J29QafzktUuccLS6LQQFlXDfQYUxOC
         LZd4x3VtzSt3Xs4bucBgpHYeqcLuLSaDC6g9cnEyGQZuqMFcuX+gzJTupgxic+40BK9o
         TLpgVa/OhLp6rsaqgdP5uWlBSg0p1l6Nm7/KTfTLFDdjhX7HKAXbsfbm2uBF24kOiKaP
         u2dQPBOc9HssObfXmphFstcstoEcvV1eEEWbjsi9lCHTAI4rrwXfnTaNtrsQKYqfIVt1
         msie8AeJhUCPDcvpx0X4uHEP2IO6ODtYRX4/bkQNHZ5oIOmAPgFgjmy0HSX9Hp2m12oq
         Tmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713918; x=1794318718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1Q1TGLPbIUVWrlqriCkZBVHwkEIWrEvexoFYfF54PE=;
        b=l61q7+kSO8cP2FlyxVL+7GNeMT3cPZ79n/im4JK/mnxpq4r9po9CkauMNxvRufLeyZ
         TXfmPpZCkENd3G4IReDA+MtAwQvbIt9w8CwD49dYrK1B34KCZOt06ixpltEClHqGADKR
         bd1E1B2o+qgVsvCaRyFhlZs9WAuMlRCFbQ4ziMqAloX5Md9F99CFqK3wTEzmxoLl5fkN
         bMWy4hfnnwTlOGj5EqLl782YzJPp7KS4mq4m+7UMdhkiKvWx+VvwKj0s5D0ew9wnsNXS
         TcLurkD7p9RCwgdfb4KmvCtsjmtDMABl98VOnZ5k76CTuqal+qUCMCTIeSvSHY6dF4ap
         klkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBT+9aZBCKWAfhmHmZYJqo6ffR7K6eNB2B9jxlemTslYW9aP79QIfNdvHBemtp0VIfmBkqxQA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/f1wZArBUgA9tV8//sXDaTU+JmejerGA1DXv59gUXiYWgN6JIE
	yeUT3NJzuPV1BxPD+kBeULr55V9WDY3SDGdogndjqBs+W/rHCe44xwPqzEUPNW3Hnw0=
X-Gm-Gg: AYBFou0UzkgcTn9c5ly+ncBmSItAiEtcDgczZ3W6VDfCRTUfmA+zvR3YhxgwcSKuoZl
	4TibL4WX5rRXyobgYas01ijKaXo+HPE8KwtIIJ0sJpu+i9FtdCbjzR7+XacMAHkm5kaT5CGkd6x
	sGGQ6vrwIi+nutPJh/mQuF5plPnnXtmJnwbRuFKY26epAckmlbLnTaTYGrMk7Cemqr6ploXlmSR
	Q8prvA4YFvKOHzZ7zhkhSysuMJf8jYF1UBOJ5Is9iZKQMKYvsbb+wCeUMvuvXTOlOrcyx72fIzG
	2zFsDK4Fw7SclQ7vn1jkXimAlWGn8U9hvJHxz7iQ/qVUGM0vCHxNCnV0ACmVL0gYB1iU2Y6QxYs
	SN6zUPrTrdYPRA+D7/+Ct4diWDoUrvJJ6/QE1HBdhmnyRMFEIu3j1IJW0F67CxqlBrrr1oskQ2C
	zQqn6yVJ9FScAXKSWKVqTI62OPzffzKnNXWelMBG4RQZfizAqL76a2IK68F5iSjS83SirGWS3FN
	VgPGNbSDQq+msiouU9mUV3iFVczYQbjElwtnN60EGDK13ScJ0z80q7BuCUA2YtQ0DRM/rM/3eqk
	kSIsBVN4ku0/1hfTRfmUMKMBtlMUKQ==
X-Received: by 2002:a05:600c:a45:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4ac1932b43amr309529445e9.31.1793713918332;
        Tue, 03 Nov 2026 05:51:58 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm115096725e9.14.2026.11.03.05.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:57 -0800 (PST)
Date: Tue, 3 Nov 2026 14:51:55 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Derek Barbosa <debarbos@redhat.com>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH printk v2] printk: Avoid multiple unregistration in
 unregister_console_locked()
Message-ID: <aunm-2bPiq2xSZFW@pathway.suse.cz>
References: <20261030135802.663893-1-john.ogness@linutronix.de>
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
In-Reply-To: <20261030135802.663893-1-john.ogness@linutronix.de>

On Fri 2026-10-30 15:03:55, John Ogness wrote:
> unregister_console_locked() is called from within
> hlist_for_each_entry_safe(console_list) loops. This would be safe if
> unregister_console_locked() only unregistered the specified console. After
> all, that is what the _safe variant is for.
> 
> However, unregister_console_locked() calls printk_kthreads_check_locked(),
> which can unregister _multiple_ consoles if kthreads fail to start. This
> could lead to hlist_for_each_entry_safe() use-after-free scenarios because
> not only was the list entry removed, but possibly the following entry as
> well (the @n temporary storage of the next entry).
> 
> Move the call to printk_kthreads_check_locked() outside of
> unregister_console_locked(). Add comments to both functions to clarify
> if they are safe to be used in hlist_for_each_entry_safe(console_list)
> loops.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/lkml/87ik31iz4x.fsf@jogness.linutronix.de
> Fixes: 76f258bf3f2a ("printk: nbcon: Introduce printer kthreads")
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

JFYI, the patch has been committed into printk/linux.git,
branch for-7.4-fixups.

Best Regards,
Petr

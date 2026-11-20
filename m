Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180189;
	b=dx9ze2KLOFeHdnNKuAATRV0KTpamQMeFHIM81DAFrzIjK8Liq7h2UrNiufb6cQsePK4n
	 hgRIUTSlyHycVs6sOnUgunQ9I88CjqiduWdsjog8eZjsNbZBi6MWsJvozfom8SYFRokKN
	 FxIg9obqa5Ki6zwRDv3h00FbXq4deuJbo+1JOG9AzZ8BCMR8dDAFKPYzy2T18fg4TpFhn
	 M2yG1Whg2ee4jMmEviLRrcHEvRKtJSrQFWgR6u6sEoxBNBp3p0gpXiSIE/ajUi7nMBvKu
	 xLBuVgZitqs62DoZF17hEi1W0o8HJzPvbx2GYZQVKTOYY73wzZvTb0LVE+KObD6b37g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PCl9o2L0h4hjzIUzxQ9Hw7xDucu8RfGeY02waG4S6Mk=;
	b=UwYPMjsMz8gDaonymHQq1y2cU7tnrBrYIi5oFs1ZQVLiU4HnLtF/NGmIbU6rydwzB/1w
	 npr+6j49yA9bVF/mlBZgFIPk4kb/0HMUZ90eEE08on2hZP0nmkOrhfb7LPjZj0rUiwG7N
	 Iqzr7JBbzozAMAqw1EVs8d4R9X6tkXXu2lCRPzNVY6bKe2oaJ7t2GRXV3ywJweTz93WdG
	 Cpg4XwfDBopbc6j0V7MWjp7thE+I5mfHUGtHP0s/LSvr5COXC7eF8aC+cdu0wQ2wr2PhR
	 g/x47e90W8l41hqlnrketJ1iJLQNNhEgPz+POOF3mWh2ShFPsK3z5wABmy7jfpfzYCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SgrI0hht;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EB0606A326
	for <printk@lists.linux.dev>; Fri, 20 Nov 2026 13:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3EB0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SgrI0hht
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb606491faso4484595e9.3
        for <printk@lists.linux.dev>; Fri, 20 Nov 2026 05:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795180187; x=1795784987; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PCl9o2L0h4hjzIUzxQ9Hw7xDucu8RfGeY02waG4S6Mk=;
        b=SgrI0hhtkfSd7jwW6eV2cVtzOnpTh0Q304JkdS4WIcNvSdzCxfWvGOKCPxFstk9KWh
         EXbNmbO4ngl3j3wI3AhE9p0/qY6C7f9O27g3Ry8XAi1gdrYTZk8QsfDD/xmlcf7de6Ve
         ZHcI5NXLnNfi0WIzK3ztVe9V4X+smdSJF2URtX3otOqv2VlSsjVAdX79lVJmkf4xHbkF
         PX8PKSP65G8LIPKVxOH7kstB7wuqSW5NvQJvYCailyaoMiCd8LgOdwZIZZacmIYV2xEZ
         ldRWZf0yPA+HnEWSiJkyWjjHwTF886XTzTLzx6D4IVuSsRZKh4vDQkHE5ncJnw8O+8HI
         nmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180187; x=1795784987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCl9o2L0h4hjzIUzxQ9Hw7xDucu8RfGeY02waG4S6Mk=;
        b=f0sXTBxES0X1mxsbcSIvUYL0/byttIbHm9+5zDwLAWCbWOSbay5XC9h8ZJrop0KOkJ
         aUlupmLChXklsmCMoCE1HoGAT89nKvX4dPTdOAglgbuC58NlTcDSRQCSKmnwOG0CtgCG
         q4GrAZJ/eCM5/my1r/hHZDhUKHEFY114aAf8Jw3mVKwRE4inNUyhZwH+zFuHploczbe4
         SAMegCyr99+btpZbqvhVqCnuc/yVlabKn9WS/GS2FuMQ1oWk1hR0iW9FQztdgUZfhC/5
         wU6S9PusBozsITRs/HIeLUktZka00xVKy3/keBPoHQ7O8NAbAnOuJ1YCpQ7rSAGe7Y3e
         scTw==
X-Forwarded-Encrypted: i=1; AL+hErGpdnFTVBDLGjOcgRuubJ35IrrgLdQNlz5V8kaD08JSPubNcUfymj/7ZS/+n34a3ilmnL/XQYY=@lists.linux.dev
X-Gm-Message-State: APuU4Z/ZWOxQ3jWk5RFsdFIGBbikZb5ZXPs7xv8IeFjhJXbYwfOAopmc
	uKdI/fL8Cds0HpQe8ZDm0fNOUPnHqdtbq7SvVaPEzMbLeJz2gZAoXWconUInC6bzkWg=
X-Gm-Gg: AYBFou28hiSYAZArdF0s+6lmx90Tygf6P6uL78SEVg46u22yqlLjrp17UMJlaHlhXlg
	gzs1Zpoa7Z6SJuH9cbn9B8935c8OTuXnljI+IN/a0HRE8yinEvB6ZXpx+C/tA8lkR6QJBJZBt9n
	ndgDieWfcS23XX1MpQ/7WwPGkfI5Gq7+0wWBI3voiMQd6t5sJxA5XmblcmlS0sGXAQOuaoloodv
	ije1UWBn2SOJR96DvLE9zwhE8ziDUN1V927Gpgw3Alz0FAhTRdwOOnfe9/pLs7GF9blrso2LxHk
	pNf0J3d0AMCi2/ha/duuDNClV9nvE72LwcGQcsUJ4hb5cHDtFlnPOUTWXfxpJYunNVKessO8vFF
	AmPtj+lp0hD6Xnce+/VMei6IWPmKrSm8DvsQuSuqPUqEsZzQRVwomd4iC8D5FE228fXBTTHf+pS
	ljr/g8PEsGd3HklMao3JlJj8LJAIUFdbVi8YdiQaM406czJ6dG2JQePZLHVwZQ111WOMzpcchXl
	ReNYQYuJYdBzVgI8Mj059ovvPWgw9NTwzgOrSFEs11JmI8A1qepILSH6kN45osRy5CNKQ75p07e
	eZiBhiD6NrVju++NwDZmvBndzBP0CFg=
X-Received: by 2002:a05:600c:8210:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb887e25e8mr70450305e9.2.1795180187116;
        Fri, 20 Nov 2026 05:09:47 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm129169365e9.14.2026.11.20.05.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:09:46 -0800 (PST)
Date: Fri, 20 Nov 2026 14:09:43 +0100
From: Petr Mladek <pmladek@suse.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: john.ogness@linutronix.de, rostedt@goodmis.org,
	senozhatsky@chromium.org, paulmck@kernel.org,
	printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] printk: ringbuffer: Annotate speculative record reads
Message-ID: <awBGl4wZKT6tmgqG@pathway.suse.cz>
References: <20261113075039.172176-1-zhujun2@cmss.chinamobile.com>
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
In-Reply-To: <20261113075039.172176-1-zhujun2@cmss.chinamobile.com>

On Fri 2026-11-13 15:50:38, Zhu Jun wrote:
> Readers may copy a finalized record while a writer recycles its storage.
> prb_read() checks the descriptor again after copying and rejects records
> that have changed, but the plain metadata and text accesses still trigger
> KCSAN reports.
> 
> Annotate the speculative copies, line counting and length read with
> data_race(). The descriptor validation continues to determine whether
> the copied record can be used.
> 
> Fixes: b6cf8b3f3312 ("printk: add lockless ringbuffer")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

JFYI, the patch has been committed into printk/linux.git,
branch for-7.5-trivial.

Best Regards,
Petr

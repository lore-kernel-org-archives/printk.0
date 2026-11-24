Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515580;
	b=pDd3vN9h+6s3W2VDVF91oRR75at6vPyAA++rmoYhMGtunvjs3IhBhQDIMNVmN6P3SzzO
	 eqC7lKOrTWnUp4nHWPzz7uS3YOusEdf6Hw/tQ1mUKF5BRIawpH0Wjpu5fqF3eintSyd3p
	 W866iVk++bEXTomnREnaHdmKNUkJj1vyLpwfxOcyEVh4xjov7YDIFW92RMGRGxG30YOvA
	 VQszldz67HW6ag9ptQ3zuaH+Rsdg+xSn18ynGq1I61ttrataePCj7DpOQtIaK7v4aBqp2
	 84hAfFyHTk2RHrSS9q+Yd1SSfk9A2AqeVfMKNbhqNLHRZlUGHk/9ERchJM26rC+VN6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vH6drgK9ot5njBsE/YZMMEhVCDG/kWSIdnxHYLHlo8o=;
	b=2vbsUc80n7JvYKSnJ3tyYoMho3U8tDzKKeX5cTU//X4b0HleyIL6XsUHBxg0jyXPKMnr
	 lSYxRX/9T6WpUdCJ0er+Wdxd8HGPfSzqmHUsY0qnezuciu5olIPAAvCI37v8reeMYYXIM
	 nTsLsvmiUjtsYsRljtX86pKMjA3R0s3ng7pgYUm7mfSMIZ7I5HY+AOR2JTgQWVklGhlmY
	 vTzTorZkUsKGm5ib8CkksHahyPSf5Og6aQplX3pbSzIn0OegzAlxNfL4auc6oWG6U/zI7
	 t6AoKMDW7LLMgU1TA1LkTPDqczxj2gUfapvixe/NiWokcrDpr4eaomp/+80ziM3KvhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=L5WcZ9Gy;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73962606A32C
	for <printk@lists.linux.dev>; Tue, 24 Nov 2026 10:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73962606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=L5WcZ9Gy
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso52371565e9.1
        for <printk@lists.linux.dev>; Tue, 24 Nov 2026 02:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795515579; x=1796120379; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vH6drgK9ot5njBsE/YZMMEhVCDG/kWSIdnxHYLHlo8o=;
        b=L5WcZ9GyGmrGy3tyHJ6Nx5H3SXB7GqNG665Aghq0w2EOLxZSiJ6fy0U0qt5PJYOuLU
         XE5XrwMXfJyjpivkW4vrx6trVqsyfv/ypdpdUpZfaAoxWtmC0uJaI0KF7qj7A5eqI7uD
         buVn+3J/y3hRduc3NNkglV/SQzZwzKMXQqjQTUEu1yhHBLoZP9yib4F580YtfJkk87tO
         OK8O4cr38im92/A0aOoSGCoTRkZg+bzjzLZ5g2J2dXdmCWCjcDT+jfMl2tYXNGouBdv8
         jQViakZZIyeaauI7pD0qN/zlDXbO8WbSxCT5DhDkWqmzjDC7KnZS0tvnU+domuPutsOc
         CiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515579; x=1796120379;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vH6drgK9ot5njBsE/YZMMEhVCDG/kWSIdnxHYLHlo8o=;
        b=zsYYfS+mJvvoNOG4+MunuKXG9VvoKQRCkrMTwUFAfLwIC3lYEI+RutSQJD/vuTXJ/A
         UFvW9K+fPjmNLqEpo7nKQDZM7Ps6wY/sNog+L/l7fvXgbqrO56HIhYhHNEDHK2/KuUNE
         lYmoHIj/Yr1FR4gmebMz9vMCqAYA4Bb2CdPATaK58FgnsFZf/eG2DIliEXzfeatVBPAW
         EUA9F9WxDeFASegGsrYAWI5jjS9inYKNKeqXqKCC4icSEKEISgfQFqnB/BAKXWNdvmsn
         JFTLd4By1fvIfg4osSh1dgyR/ICNFbfTbk6RSbuwfHwSOReDjDr7gwOoSyKPRn4UhCrz
         Mpfw==
X-Forwarded-Encrypted: i=1; AL+hErFT9udg+iIzJXL366T4WVeWQKrMN1Z7wmc2yjT/u2S5w1TVm2uS0zmE6qN4ZSKjTjynxepkXTo=@lists.linux.dev
X-Gm-Message-State: APuU4Z9061tCQ38tYM+6VnyEqEwY/q+nSUuau4/TdM0VcZtiHlt5tkc2
	dG1idYUtPCCsoUAklcAvgTmvbQN45L9fqIuM7qRdfMDXYiSecGZDr9TbLMso7YvnjQGyIMZEgKW
	8Lj68VE4=
X-Gm-Gg: AZFdTZd6b33s2dcWwEsk9NA8aMgBiEYLXqtMRNkD6y34Ragu4mGmrhKb7wk2yxM1zRQ
	+/xzUNWuotqTf0rfpRCU7VoJ83HOBuq2CO/n0bVH/9dO9D+ybLkkJ3kz/ThFq724Pu+WzElDJQ1
	4Fpv9Ny3/tBRKPLJhoZhYkAXhTYs8jsAvN476b3je+fbHrBKDCgLjgQm8s4bkWIVnygDHWha1VG
	to6cX46moMSBUIYvTZ+se68F4SLHg2j1wGAb/0cl1rVjiiI3kh2o4nVqN5rlLYYBaBaVoUo1mwr
	AQMkkshKiZa2bB+sOW3TG8XNKjDNRUNg+0aSs+PouSczPf39q4006muKYdEvAstXB8rxQsqMYkk
	W5DEYwHtINF/bTkstIY1oaQCt3/+aFCV7WaPkUrGjUcg7V8V5HiJzYP8ywf1crm7PSPhpvCNmvy
	+DwEZuCRjfMHZjJToCZxgtaRScynKPcKydhvNvGixq4TPnA4v6GY5GlT1CkGxz/QrUw+/llh0fs
	nubN9hpWouhgnYl2bmdZQqPMs948YHJwtEv52jtcEORn/CLMlk5eiPEsmJOK0DR4UkiFiuGRn53
	KKzPJMEiD1uDU6SCILjZ4uKKwkidhv4=
X-Received: by 2002:a05:600c:4f50:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4bb888063f3mr353813745e9.16.1795515578920;
        Tue, 24 Nov 2026 02:19:38 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm437410945e9.2.2026.11.24.02.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:19:38 -0800 (PST)
Date: Tue, 24 Nov 2026 11:19:36 +0100
From: Petr Mladek <pmladek@suse.com>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Chris Down <chris@chrisdown.name>,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] printk: Fix skipped entries after index iterator restart
Message-ID: <awVkuPWD6DHnuV98@pathway.suse.cz>
References: <20261116085609.476250-2-thnkslprpt@gmail.com>
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
In-Reply-To: <20261116085609.476250-2-thnkslprpt@gmail.com>

On Mon 2026-11-16 10:56:10, Avi Weiss wrote:
> seq_read_iter() can advance the iterator before the next record
> fits in the read buffer. When iteration resumes, pi_start() calls
> pi_next() at the saved position and advances past the pending printk
> index entry. As a result, index reads can silently omit formats.
>
> Return the entry corresponding to the saved position without
> advancing the iterator.

Great catch!

But honestly, I was a bit confused by the description. I think that
it is not easy to describe it a reasonable way. Well, I wonder
if the following is more clear:

<proposal>
seq_read_iter() calls pi_next() until it reads the last entry or until
the given read buffer gets full. The it calls pi_stop() in both
situations.

The next seq_read_iter() calls pi_start() to (re)start the session.
pi_start() is supposed to either start from the the beginning or
return the last entry which did not fit into the read buffer.

By other words, pi_start() should not call pi_next() which would return
the next entry. Instead it should return the entry which did not fit
into the buffer last time. Otherwise, the entry would get skipped.

Note that *pos is off-by-one because "0" position is used for the
title string (struct seq_operations). So that pr_start() should
return the *pos - 1 entry.
</proposal>

> Fixes: 337015573718 ("printk: Userspace format indexing support")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>

Otherwise the patch looks good to me. With the updated commit
message:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

PS: I am going to wait few days for potential feedback. Then I will
    commit the patch with the updated commit messages unless anyone
    complains in the meantime.


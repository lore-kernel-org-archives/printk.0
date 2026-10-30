Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368326;
	b=xcY4XtP7b4V2hAW4yq556mfNFAlAV4oStNzaOk463LcRR0OkCpN3ul9j96KMBnulXNC3
	 CbXe4oejx/JwZOBZc6N/AkojTjcTUuO9nHzTB9ebIaBCYKSi1A6sop7vOwfcJM9qh1Hs5
	 dLYcHiSk5c06p4UUBrG746NhVGIGd9KZa96o8mMMoezX9tipgFv/aZCg2VN2GxKSgtTi/
	 ZfdC7F10BVUvlm52xynB+NN6dQ40pBfkAgQ/35ftcQSuzKx05drUOsvbxtaj0MiU4VYh5
	 OyyIzgE2dhU4BBOz7QtUmEZjkF35h8PH9FfMPRSGc7A2piHizgusV0f1MsS66O/whMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SXBe5FDUaux8CGMgkiRMsJSb/8g4y+WkcIulnsCpl5I=;
	b=KKXopRHV3G8aw9k13suFn0sqfOMMJa1XMJTEsGPaXtXfucb31VTyKVs5Ko2p6U/N8/N5
	 tPuPwbTbbFK9tsUcGprPD+EFyFviIDIAMyKtvQt1n5smeZOrWPtgfV+BMZk0BZT2XnzjQ
	 9ay9wIcDfTyaAdpBcSeYCAaeu1T/2Ybo0rnBxz3FRUglyt/A+BPHyzSSssUOsxajMmrWE
	 zxB+1KKpYEy6Ak/++rq0ekuYO4SXGxPht5o8PRyutKpAtmmFiyK31BG3T7nMtDFJeSEub
	 rGDHFI7fZzkDYJDOnaP4e0hh5xGjRjHyhTbyGDiRbA55e2D26yjn/dd+7MCXgupqHig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ff6E0UBD;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C9B606A31F
	for <printk@lists.linux.dev>; Fri, 30 Oct 2026 13:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C9B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ff6E0UBD
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4be28b82so758795f8f.2
        for <printk@lists.linux.dev>; Fri, 30 Oct 2026 06:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793368324; x=1793973124; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXBe5FDUaux8CGMgkiRMsJSb/8g4y+WkcIulnsCpl5I=;
        b=ff6E0UBDOx6K4D727CCciQKNSxvPltt6yL2yoofdKcyfBMr7tpALz/ZFCnvsqcyf+g
         0BhEWVbVYbdZZXRtYKxQ9JmWZNF0tWeP0Olafwrl0LjOJ5ggHXuBNo/85uS27i3GKo98
         X73OcJ1PxXoxomkbehe8KHRdqUl6YX2SV0KKsAsH/kq8rheMb5d3JSqR95rrAxneJiiZ
         d4AGGboyRbVIXXYxEa5YDK3dVEdt0t4tL1c6HZsaHSEud/IrxfRTJPveAV3kjLemErGF
         Oea1UvpzyFEL2CdVnAty6Q2GosFSM+RLdkOoppQpj4K5HInjIEn5zgzTukFzpB00kC8C
         7gCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368324; x=1793973124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SXBe5FDUaux8CGMgkiRMsJSb/8g4y+WkcIulnsCpl5I=;
        b=d/Ho3JiU6sj9zybZD8PtvnMIR7D6+EivbmRmXlqo9VrMZyQEoLh9PAavNK1G7Yol7Z
         xDpkd5i3+mLtvb7dg2qKjiFUmLi4OtmNMU4ZccA5MMlUVdmKlwuoQc/qK0A7vHc+FsIw
         XZTgAfAhYpK4AwNYAGuVMXG7a8koECvY7fPA1wLZAdhSgDW22cDe4Jgd5X/ZGcvkIqmQ
         WgJCD608iIr1Q8/cM4KnDYX9Xn+4ccAZPhllQB9MU/QZw83xvcGyUx5UmSbDURqhDs2C
         5ChGXeVmTjNxyN/rcBHNopwAb0+TtTm8MPkNzRV/jxIGNddrs3aeO1qXtd5PrZ8GE2Dj
         QjEg==
X-Forwarded-Encrypted: i=1; AKwUvByLevB+4ardvxHDOeR9fzjyZTztn25fQ+H7o3iTBsq791GMOcAWY491FzN0PFMt+9m1UMOz8og=@lists.linux.dev
X-Gm-Message-State: AFq9FYImCIkemubkYBVIWJOu/wti6mAKEVdxZRaJnpjHffXcAOXcxHBI
	TjkUo8BVkuky07WvlvTgIiK6JCtYni5QLdUG04G2ZR5dkQDzZtOVmpYBpa9H7pYQrMw=
X-Gm-Gg: AYBFou1yhmU7Sy8t5oORQd2YnfRtZ6c0XktxgAoKU4+7IOyytVUbpCMywcCYV2fZWgM
	jOgV8aMSrG/E0ktUpmNnqS4TscJCfwZBNwmmai0cXjoSbv5TRQtlP251qqGUKCM4j3UFZjpM4k5
	fEwQPdaJK+x6IMuQ8iVCQ9y9Sl71mshNcXBRdJDRMdAdi4As831IBqcePiOeNtu5ay93uZwvS4g
	jwdoQThg4A7XZ7aOxb8W7DQCBsqA2fZc1NxOoHjAU4Ed1scRGfjrDzJYArRwyfP2RuyZ+pWPEGW
	nKnPDNpedd5pNTECUc9t4DpUKciC0JuHG1Bb99U7pnI2AYcP7fiQIzgLNx458i6viJ8B+SbLGiW
	7cVh2i569lqvAtjvyxqX7N0CElvzBABIN6yPNo7+eL581R1AXCsAV04k8CmuB64rYUMCLQYY6Oe
	tqVfqg69a7UssfeSgNCk4Rd6Bk6iYc486vG25HNrb3Ifja+GF/9BRY3p+oUtE6caaKYUm4+0U8G
	Aq2RGOtTSF6JeQRTZIFAG+L7NR9PpgrIMEWUTZdi/VszURLGDdcy5EczIgXPswfX4LtWfRiSarw
	or4XBAEwPCJGlC6TKkRf
X-Received: by 2002:a05:6000:454b:b0:48c:49bd:62df with SMTP id ffacd0b85a97d-48e6e2bc9c2mr3892543f8f.1.1793368323808;
        Fri, 30 Oct 2026 06:52:03 -0700 (PDT)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba4ac6sm3514204f8f.52.2026.10.30.06.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:52:03 -0700 (PDT)
Date: Fri, 30 Oct 2026 14:52:01 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Derek Barbosa <debarbos@redhat.com>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH printk] printk: Avoid multiple unregistration in
 unregister_console_locked()
Message-ID: <auShAQbJAwSqI6gu@pathway>
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
In-Reply-To: <87y0bgwm0y.fsf@jogness.linutronix.deq>

On Thu 2026-10-29 16:48:53, John Ogness wrote:
> On 2026-10-29, Sashiko wrote:
> >> @@ -4471,6 +4493,9 @@ static int __init printk_late_init(void)
> >>  		}
> >>  
> >>  		unregister_console_locked(con);
> >> +
> >> +		/* Changed console list, may require printer threads to start/stop. */
> >> +		printk_kthreads_check_locked();
> >>  	}
> >
> > Should printk_kthreads_check_locked() be called after the
> > hlist_for_each_entry_safe(con, tmp, &console_list, node) loop in
> > printk_late_init() rather than inside the loop body?
> >
> > In kernel/printk/printk.c:printk_late_init():
> >
> >	hlist_for_each_entry_safe(con, tmp, &console_list, node) {
> >		if (!(con->flags & CON_BOOT))
> >			continue;
> >		...
> >		unregister_console_locked(con);
> >
> >		/* Changed console list, may require printer threads to start/stop. */
> >		printk_kthreads_check_locked();
> >	}
> >	console_list_unlock();
> >
> > Because printk_kthreads_check_locked() is placed inside the loop,
> > unregistering the last boot console sets have_boot_console to false and
> > immediately attempts to start printer kthreads while the loop is still
> > iterating over console_list.
> >
> > If kthread creation in legacy_kthread_create() or nbcon_kthread_create()
> > fails for the console stored in tmp, printk_kthreads_check_locked() calls
> > unregister_console_locked() on that console, removing it with
> > hlist_del_init_rcu(), freeing nbcon resources, and invoking console->exit().
> > On the next iteration of printk_late_init(), con is set to tmp, accessing the
> > already-unregistered console and terminating the walk early because
> > hlist_del_init_rcu() cleared tmp->next.
> 
> Geez, sorry. Obviously printk_kthreads_check_locked() needs to be
> outside of the hlist_for_each_entry_safe(console_list) loop. That was
> the whole point of the series!
> 
> I will wait a day for v2 in case there is any feedback regarding my
> comments (or lack thereof).

JFYI, the comments look good to me.

It is quite twisted problem. I have got lost again when looking at
this patch. I am not surprised that the 1st version was not right. ;-)

Best Regards,
Petr
